//
//  ViewController.swift
//  tableView
//
//  Created by Роман on 16.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let customTableViewCellIdentifier = "customCell"
    private let customTableViewHeaderIdentifier = "customHeader"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customTableViewCellIdentifier)
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: customTableViewHeaderIdentifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        title = "Music Album"
        configureView()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        !modelSelection[section].isOpen ? 0 : modelSelection[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier, for: indexPath) as! CustomTableViewCell
        let modelCell = modelSelection[indexPath.section].data[indexPath.row]
        cell.configCell(model: modelCell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: customTableViewHeaderIdentifier)
            as! CustomHeaderView
        let model = modelSelection[section]
        header.configureHeader(title: model.title,
                               buttonTag: section,
                               buttonTappedCallback: expandSection)
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelSelection.count
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
}

extension ViewController {
    private func configureView(){
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func expandSection(_ tag: Int) {
        let section = tag
        
        var indexPaths = [IndexPath]()
        for row in modelSelection[section].data.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        let isOpen = modelSelection[section].isOpen
        modelSelection[section].isOpen = !isOpen
        
        if isOpen {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    
}


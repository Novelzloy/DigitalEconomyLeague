//
//  CustomViewController.swift
//  tableRemove
//
//  Created by Роман on 23.03.2022.
//

import UIKit

class CustomViewController: UIViewController {
    
    private var model = itemList
    
    private let identifierCellReuseIdentifier = "cell"
    private let identifierForHeaderFooterViewReuse = "customHeader"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierCellReuseIdentifier)
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: identifierForHeaderFooterViewReuse)
        return tableView
    }()
    
    private lazy var moveButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Move or Delete",
                                     style: .plain,
                                     target: self,
                                     action: #selector(moveBarButtonItem))
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.frame = view.bounds
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My fridge"
        navigationItem.rightBarButtonItem = moveButton
    }

}

extension CustomViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].itemToList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model[section].nameItem
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCellReuseIdentifier, for: indexPath)
        let text = model[indexPath.section].itemToList[indexPath.row].nameFood
        cell.textLabel?.text =  text
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let modelToMove = model[sourceIndexPath.section].itemToList[sourceIndexPath.row]
        model[sourceIndexPath.section].itemToList.remove(at: sourceIndexPath.row)
        model[destinationIndexPath.section].itemToList.insert(modelToMove, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            model[indexPath.section].itemToList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: identifierForHeaderFooterViewReuse) as? CustomHeader
        header?.labelForSection.text = model[section].nameItem
        header?.buttonAddItem.tag = section
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    @objc func moveBarButtonItem() {
        if tableView.isEditing{
            tableView.isEditing = false
            moveButton.title = "Move or Delete"
        } else {
            tableView.isEditing = true
            moveButton.title = "Stop"
        }
    }
}

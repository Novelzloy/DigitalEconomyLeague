//
//  FavoriteTableViewCell.swift
//  AppNews
//
//  Created by Роман on 10.04.2022.
//

import UIKit
import CoreData


class FavoriteTableViewController: UIViewController {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var dataFromNetwork: [DataFromNetwork] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 1000
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomTableViewCell.self,
                           forCellReuseIdentifier: FavoriteTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite News"
        view.backgroundColor = .systemBlue
        view.addSubview(tableView)
        tableView.frame = view.bounds
        fetchData()
    }
}

extension FavoriteTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFromNetwork.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.identifier, for: indexPath)
        let data = dataFromNetwork[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = data.title
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func fetchData() {
        let fetch = DataFromNetwork.fetchRequest()
        do {
            dataFromNetwork = try context.fetch(fetch)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

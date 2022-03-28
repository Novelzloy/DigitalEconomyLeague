//
//  CustomViewController.swift
//  moveAndВeleteCell
//
//  Created by Роман on 28.03.2022.
//

import UIKit

class CustomViewController: UIViewController {
    
    var model = itemList
    
    private let identifierCellReuseIdentifier = "cell"
    private let identifierForHeaderFooterViewReuse = "customHeader"
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 1000
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
        header?.buttonAddItem.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
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

extension CustomViewController {
    
    func showAlert(section: Int) {
        let alert = UIAlertController(title: "Add your product from the store", message: "", preferredStyle: .alert)
        
        alert.addTextField { UITextField in }
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { [weak self] UIAlertAction in
            let foodItem = (alert.textFields![0] as UITextField).text
            DispatchQueue.main.async {
                guard let self = self, let foodItem = foodItem else { return }
                let food = Food(nameFood: foodItem)
                self.model[section].itemToList.append(food)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath.init(row: self.model[section].itemToList.count - 1, section: section)], with: .fade)
                self.tableView.endUpdates()
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func didTapAdd(button: UIButton) {
        showAlert(section: button.tag)
    }
}

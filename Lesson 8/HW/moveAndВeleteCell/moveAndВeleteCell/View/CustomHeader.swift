//
//  CustomHeader.swift
//  moveAndВeleteCell
//
//  Created by Роман on 28.03.2022.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    
    lazy var buttonAddItem: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "cart.fill.badge.plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelForSection: UILabel = {
        let label = UILabel()
        label.text = "Fruit"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomHeader {
    func setupHeaderView() {
        self.addSubview(labelForSection)
        self.addSubview(buttonAddItem)
        
        NSLayoutConstraint.activate([
            labelForSection.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            labelForSection.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelForSection.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            

            buttonAddItem.topAnchor.constraint(equalTo: labelForSection.topAnchor),
            buttonAddItem.leadingAnchor.constraint(equalTo: labelForSection.leadingAnchor, constant: 300),
            buttonAddItem.bottomAnchor.constraint(equalTo: labelForSection.bottomAnchor),
        ])
    }
}


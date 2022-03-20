//
//  CustomHeaderView.swift
//  tableView
//
//  Created by Роман on 20.03.2022.
//

import UIKit

final class CustomHeaderView: UITableViewHeaderFooterView {
    
    private var buttonTappedCallback:((_ tag: Int) -> Void)?
    
    private lazy var titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton(type: .detailDisclosure)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        return btn
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(title: String, buttonTag: Int, buttonTappedCallback: @escaping ((_ tag: Int) -> Void)) {
        titleHeader.text = title
        button.tag = buttonTag
        self.buttonTappedCallback = buttonTappedCallback
    }
}

extension CustomHeaderView {
    private func configure() {
        addSubview(titleHeader)
        addSubview(button)
        
        NSLayoutConstraint.activate([
        
            titleHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            button.topAnchor.constraint(equalTo: titleHeader.topAnchor),

            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
        ])
    }
    
    @objc
    private func didTapButton(_ sender: UIButton) {
        let item = sender.tag
        buttonTappedCallback?(item)
    }
    
}


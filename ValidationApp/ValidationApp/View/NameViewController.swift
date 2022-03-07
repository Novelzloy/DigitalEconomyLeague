//
//  NameViewController.swift
//  ValidationApp
//
//  Created by Роман on 07.03.2022.
//

import UIKit

class NameViewController: UIViewController {
    
    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
    }()
    
    lazy var buttonValidate: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Don't push me", for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButton), for: .touchUpInside)
        return button
    }()
    
    lazy var validationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидацию"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension NameViewController {
    private func configure() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardView)
        cardView.addSubview(nameTextField)
        cardView.addSubview(buttonValidate)
        cardView.addSubview(validationLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            nameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            nameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            
            validationLabel.topAnchor.constraint(equalTo: buttonValidate.bottomAnchor, constant: 18),
            validationLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            validationLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            validationLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -18),
            
            buttonValidate.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 18),
            buttonValidate.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            buttonValidate.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
        ])
    }
    
    @objc
    private func didTapValidateButton(){
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        validationLabel.text = isValid ? "Валидация прошла успешна": "В поле ошибка"
        validationLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

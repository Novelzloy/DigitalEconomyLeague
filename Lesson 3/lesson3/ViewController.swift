//
//  ViewController.swift
//  lesson3
//
//  Created by Роман on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var mailViewCard: UIView = {
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
    
    lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите вашу почту"
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
    
    lazy var mailButtonValidation: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Don't push me", for: .highlighted)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapValidateButtonForMail), for: .touchUpInside)
        return button
    }()
    
    lazy var validationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидацию"
        return label
    }()
    
    lazy var validationMailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидацию"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}
// MARK: -
extension ViewController {
    private func configureView(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardView)
        cardView.addSubview(nameTextField)
        cardView.addSubview(buttonValidate)
        cardView.addSubview(validationLabel)
        
        view.addSubview(mailViewCard)
        mailViewCard.addSubview(mailTextField)
        mailViewCard.addSubview(mailButtonValidation)
        mailViewCard.addSubview(validationMailLabel)
        
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 18),
            nameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            nameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            
            buttonValidate.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 18),
            buttonValidate.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            buttonValidate.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            
            validationLabel.topAnchor.constraint(equalTo: buttonValidate.bottomAnchor, constant: 18),
            validationLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 18),
            validationLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -18),
            validationLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -18),
            
            mailViewCard.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 200),
            mailViewCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mailViewCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            mailTextField.topAnchor.constraint(equalTo: mailViewCard.topAnchor, constant: 18),
            mailTextField.leadingAnchor.constraint(equalTo: mailViewCard.leadingAnchor, constant: 18),
            mailTextField.trailingAnchor.constraint(equalTo: mailViewCard.trailingAnchor, constant: -18),

            mailButtonValidation.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 18),
            mailButtonValidation.leadingAnchor.constraint(equalTo: mailViewCard.leadingAnchor, constant: 18),
            mailButtonValidation.trailingAnchor.constraint(equalTo: mailViewCard.trailingAnchor, constant: -18),

            validationMailLabel.topAnchor.constraint(equalTo: mailButtonValidation.bottomAnchor, constant: 18),
            validationMailLabel.leadingAnchor.constraint(equalTo: mailViewCard.leadingAnchor, constant: 18),
            validationMailLabel.trailingAnchor.constraint(equalTo: mailViewCard.trailingAnchor, constant: -18),
            validationMailLabel.bottomAnchor.constraint(equalTo: mailViewCard.bottomAnchor, constant: -18),
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
    
    @objc
    private func didTapValidateButtonForMail(){
        let emailRegex = "[A-Z0-9a-z.-_]+@+[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        let isValid = emailPredicate.evaluate(with: mailTextField.text)

        validationMailLabel.text = isValid ? "Валидация прошла успешна": "В поле ошибка"
        validationMailLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

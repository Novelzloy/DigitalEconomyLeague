//
//  MailViewController.swift
//  ValidationApp
//
//  Created by Роман on 07.03.2022.
//

import UIKit

class MailViewController: UIViewController {

    lazy var mailViewCard: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите вашу почту"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        return textField
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

extension MailViewController {
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mailViewCard)
        mailViewCard.addSubview(mailTextField)
        mailViewCard.addSubview(mailButtonValidation)
        mailViewCard.addSubview(validationMailLabel)
        
        NSLayoutConstraint.activate([
            mailViewCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
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
    private func didTapValidateButtonForMail(){
        let emailRegex = "[A-Z0-9a-z.-_]+@+[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)
        let isValid = emailPredicate.evaluate(with: mailTextField.text)

        validationMailLabel.text = isValid ? "Валидация прошла успешна": "В поле ошибка"
        validationMailLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

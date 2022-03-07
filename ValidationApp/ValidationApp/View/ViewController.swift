//
//  ViewController.swift
//  ValidationApp
//
//  Created by Роман on 05.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy private var buttonCallScreenNameValidate: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.setTitle("Валидация имени", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(callNameViewController), for: .touchUpInside)
        return button
    }()
    
    lazy private var buttonCallScreenMailValidate: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.setTitle("Валидация e-mail", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        button.addTarget(self, action: #selector(callMailViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
    }

}

extension ViewController {
    private func configureView(){
        
        view.backgroundColor = .systemPurple
        
        view.addSubview(buttonCallScreenNameValidate)
        view.addSubview(buttonCallScreenMailValidate)
        
        NSLayoutConstraint.activate([
            buttonCallScreenNameValidate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            buttonCallScreenNameValidate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonCallScreenNameValidate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            buttonCallScreenMailValidate.topAnchor.constraint(equalTo: buttonCallScreenNameValidate.topAnchor, constant: 100),
            buttonCallScreenMailValidate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonCallScreenMailValidate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        ])
    }
    
    @objc
    private func callNameViewController() {
        navigationController?.pushViewController(NameViewController(), animated: true)
    }
    
    @objc
    private func callMailViewController() {
        navigationController?.present(MailViewController(), animated: true , completion: nil)
    }
}


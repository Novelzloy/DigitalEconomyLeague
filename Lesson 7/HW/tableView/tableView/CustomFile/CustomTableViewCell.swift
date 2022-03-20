//
//  CustomTableViewCell.swift
//  tableView
//
//  Created by Роман on 16.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private lazy var imageCover: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleArtist: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleRating: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.sizeToFit()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 2
        return button
    }()
    
    lazy var starImageRating: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "star.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        initCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(model: ModelMusic){
        titleArtist.text = model.artist
        imageCover.image = UIImage(named: model.cover)
        titleRating.text = "Rating: \(model.rating)"
    }

}


extension CustomTableViewCell {
    private func initCell(){
        contentView.addSubview(imageCover)
        contentView.addSubview(titleArtist)
        contentView.addSubview(titleRating)
        contentView.addSubview(button)
        contentView.addSubview(starImageRating)
        
        NSLayoutConstraint.activate([
            imageCover.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageCover.widthAnchor.constraint(equalToConstant: 60),
            imageCover.heightAnchor.constraint(equalToConstant: 60),
            imageCover.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            
            titleArtist.topAnchor.constraint(equalTo: imageCover.topAnchor),
            titleArtist.leadingAnchor.constraint(equalTo: imageCover.leadingAnchor, constant: 100),
            titleArtist.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            button.topAnchor.constraint(equalTo: titleArtist.topAnchor, constant: 50),
            button.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            button.leadingAnchor.constraint(equalTo: titleArtist.leadingAnchor, constant: 200),
            button.heightAnchor.constraint(equalToConstant: 20),
            
            titleRating.topAnchor.constraint(equalTo: button.topAnchor),
            titleRating.leadingAnchor.constraint(equalTo: titleArtist.leadingAnchor),
            titleRating.trailingAnchor.constraint(equalTo: starImageRating.leadingAnchor, constant: 30),
            
            starImageRating.topAnchor.constraint(equalTo: button.topAnchor),
            starImageRating.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -30),
            starImageRating.leadingAnchor.constraint(equalTo: titleRating.leadingAnchor, constant: 150),
            
        ])
        
    }
}

//
//  CustomTableViewCell.swift
//  AppNews
//
//  Created by Роман on 10.04.2022.
//

import UIKit
import CoreData

class CustomTableViewCellViewModel {
    let title: String
    let description: String
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(title: String, description: String, imageURL: URL?) {
        self.title = title
        self.description = description
        self.imageURL = imageURL
    }
}

class CustomTableViewCell: UITableViewCell {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    static let identifier = "NewsCell"
    
    private lazy var tittleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var imageNews: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "star.fill"), for: .normal)
        button.tintColor = .systemMint
        button.addTarget(self, action: #selector(addNewFavorite), for: .touchUpInside)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageNews)
        contentView.addSubview(tittleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(starButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureConstraint()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: CustomTableViewCellViewModel) {
        tittleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        if let dataImage = viewModel.imageData {
            self.imageNews.image = UIImage(data: dataImage)
        } else if let url = viewModel.imageURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
                guard let data = data, error == nil else { return }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.imageNews.image = UIImage(data: data)
                }

            }.resume()
        }
    }
    
    @objc func addNewFavorite() {
        guard let entityDescription = NSEntityDescription.entity(
            forEntityName: "DataFromNetwork",
            in: context)
        else { return }
        guard let dataFromNetwork = NSManagedObject(entity: entityDescription,
                                                    insertInto: context) as? DataFromNetwork else {return}
        dataFromNetwork.title = tittleLabel.text
        dataFromNetwork.descriptionTitle = descriptionLabel.text
        dataFromNetwork.urlToImage = imageNews.image?.pngData()
        
        if context.hasChanges{
            do {
                try context.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}

extension CustomTableViewCell {
    
    func configureConstraint() {
        tittleLabel.frame = CGRect (x: 10,
                                    y: 0,
                                    width: contentView.frame.size.width - 170,
                                    height: 70
        )
        descriptionLabel.frame = CGRect (x: 10,
                                         y: 70,
                                         width: contentView.frame.size.width - 170,
                                         height: contentView.frame.size.height / 2
        )
        imageNews.frame = CGRect (x: contentView.frame.size.width - 150,
                                  y: 6,
                                  width: 140,
                                  height: contentView.frame.size.height - 10
        )
        starButton.frame = CGRect (x: contentView.frame.size.width - 150,
                                   y: 6,
                                   width: 25,
                                   height: 25
        )
    }
}

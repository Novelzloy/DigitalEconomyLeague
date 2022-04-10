//
//  FetchTopStories.swift
//  AppNews
//
//  Created by Роман on 10.04.2022.
//
//
//import Foundation
//
//class FetchTopStories: MainViewController {
//    
//    func fetchData () {
//        APICaller.shared.getTopStories { [weak self] result in
//            switch result{
//            case .success(let articles):
//                self?.articles = articles
//                self?.viewModel = articles.compactMap ({
//                    CustomTableViewCellViewModel(
//                        title: $0.title,
//                        description: $0.description ?? "No description",
//                        imageURL: URL(string: $0.urlToImage ?? "")
//                    )
//                })
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}

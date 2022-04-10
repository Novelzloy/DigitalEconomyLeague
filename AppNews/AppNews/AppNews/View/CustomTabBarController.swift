//
//  CustomTabBarController.swift
//  AppNews
//
//  Created by Роман on 10.04.2022.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    private let mainVC = MainViewController()
    private let customTVC = CustomTableViewCell()
    
    private let newspaper = UIImage(systemName: "newspaper")
    private let star = UIImage(systemName: "star")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            viewControllersConfiguration(rootViewController: MainViewController(), title: "News", image: newspaper!),
            viewControllersConfiguration(rootViewController: FavoriteTableViewController(), title: "Favorite", image: star!)
        ]
    }
    
    fileprivate func viewControllersConfiguration(rootViewController: UIViewController,
                                                  title: String,
                                                  image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}

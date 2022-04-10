//
//  Model.swift
//  AppNews
//
//  Created by Роман on 09.04.2022.
//

import Foundation

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let source: Source
}

struct Source: Codable {
    let name: String
}

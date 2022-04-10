//
//  APICaller.swift
//  AppNews
//
//  Created by Роман on 09.04.2022.
//

import Foundation
import UIKit

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        static let topUrl = URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey=6010eb486f2741cc8d6dadd3138a2131")
        static let searchUrlString = "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=6010eb486f2741cc8d6dadd3138a2131&q="
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.topUrl else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                } catch  {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    public func search(with query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                } catch  {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

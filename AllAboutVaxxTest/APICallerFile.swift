//
//  APICallerFile.swift
//  AllAboutVaxx
//
//  Created by Abir-Mac on 3/25/22.
//

import Foundation

final class APICallerFile {
    static let shared = APICallerFile()
    
    struct Constrants {
        static let healthNewsURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=b719159a1fdb40a09a5e548afadf17db")
    }
    
    private init () {}
    
    public func getHealthNews (completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constrants.healthNewsURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

// Models

struct APIResponse: Codable {
    let articles: [Article]
}
struct Article : Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}

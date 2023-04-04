//
//  API.swift
//  F7
//
//  Created by Otakhon Toshpulatov on 04/04/23.
//

import Foundation
final class API {
    static let shared  = API()
    struct Constants {
        static let  topheadlineURL = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-04-02&to=2023-04-02&sortBy=popularity&apiKey=dd2330cd884e41eb8573ac5508a3549b")  }
    
    
    private init() {}
    public func getnews(completion: @escaping (Result < [String], Error>) -> Void){
        guard let url = Constants.topheadlineURL else {
            return
        }
        let task  = URLSession.shared.dataTask(with: url) {data, _, error in
            if let  error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    _ = try JSONDecoder().decode(String.self, from: data)
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
struct Articles:

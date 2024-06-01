//
//  GitHubService.swift
//  GitHubSearch
//
//  Created by Amit  Singh on 01/06/24.
//

import Foundation

class GitHubService {
    func searchRepositor(query: String, completion: @escaping ([Repository]?) -> Void) {
        let urlString = "https://api.github.com/search/repositories?q=\(query)"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response , error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let repositoryResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(repositoryResponse.items)
            } catch {
                completion(nil)
            }
        }.resume()
    }
}

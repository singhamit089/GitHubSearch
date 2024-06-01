//
//  Repository.swift
//  GitHubSearch
//
//  Created by Amit  Singh on 01/06/24.
//

import Foundation

struct Repository: Codable, Identifiable {
    var id: Int
    let name: String?
    let full_name: String?
    let description: String?
    let url: String?
}

struct SearchResponse: Codable {
    let total_count: Int
    let items: [Repository]
}

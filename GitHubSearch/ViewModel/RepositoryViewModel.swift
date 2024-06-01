//
//  RepositoryViewModel.swift
//  GitHubSearch
//
//  Created by Amit  Singh on 01/06/24.
//

import Combine
import Foundation

class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var isLoading: Bool = false
    private var gitHubService = GitHubService()
    
    func searchRepositories(query: String) {
        self.isLoading = true
        gitHubService.searchRepositor(query: query) { [weak self] repositories in
            DispatchQueue.main.async {
                self?.repositories = repositories ?? []
                self?.isLoading = false
            }
        }
    }
}

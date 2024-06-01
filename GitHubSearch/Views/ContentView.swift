//
//  ContentView.swift
//  GitHubSearch
//
//  Created by Amit  Singh on 01/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RepositoryViewModel()
    @State private var searchQuery = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchQuery, onCommit: {
                    viewModel.searchRepositories(query: searchQuery)
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                List(viewModel.repositories) { repository in
                    NavigationLink(destination: RepositoryDetailView(repository: repository)) {
                        Text(repository.name ?? "No Name")
                    }
                }
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
            }
        }
        .navigationTitle("Repository Detail")
    }
}

struct RepositoryDetailView: View {
    let repository: Repository
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            Text(repository.full_name ?? "No Full Name")
                .font(.title)
            Text(repository.description ?? "No description")
            if let url = URL(string: repository.url ?? "No URL") {
                Link(destination: url) {
                    Text("View it on GitHub")
                }
            }
        })
    }
}

#Preview {
    ContentView()
}

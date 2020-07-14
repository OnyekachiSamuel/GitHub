//
//  UserCommitViewModel.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public class UserCommitViewModel {
    private let apiClient: APIClientProtocol
    var completion: (([CommitAuthor], String?) -> Swift.Void)?
    
    init(apiClient: APIClientProtocol = GitHub.api) {
        self.apiClient = apiClient
    }
    
    func fetchCommits() {
        apiClient.send(request: .fetchCommits(completion: { [weak self] result in
            guard let self = self else { return }
            let authors: [CommitAuthor]
            switch result {
                case .success(let commits):
                    authors = commits.map { $0.commit.author }
                    self.completion?(authors, nil)
                case .failure(let error):
                    self.completion?([], error.localizedDescription)
            }
        }))
    }
}

//
//  HomeController.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel.completion = { [weak self] (commits, error) in
            guard let self = self else { return }
            self.commitAuthors = commits
            self.tableView.reloadData()
        }
        viewModel.fetchCommits()
    }
    
    // MARK: Private Instance Properties
    
    private let viewModel = HomeViewModel()
    private var commitAuthors: [CommitAuthor] = []
    
    // MARK: Private Instance Method
    
    private func setupView() {
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
    }
}

extension HomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitAuthors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.reuseIdentifier, for: indexPath) as! HomeCell
        let commitAuthor = commitAuthors[indexPath.row]
        cell.viewModel = HomeCellViewModel(commitAuthor: commitAuthor)
        return cell
    }
}




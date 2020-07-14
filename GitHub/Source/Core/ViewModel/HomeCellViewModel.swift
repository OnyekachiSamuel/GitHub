//
//  HomeCellViewModel.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

class HomeCellViewModel {
    let name: String
    init(commitAuthor: CommitAuthor) {
        self.name = commitAuthor.name
    }
}

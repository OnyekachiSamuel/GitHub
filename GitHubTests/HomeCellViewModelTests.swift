//
//  HomeCellViewModelTests.swift
//  GitHubTests
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import XCTest
@testable import GitHub

class HomeCellViewModelTests: XCTestCase {
    var viewModel: HomeCellViewModel?
    let commitAuthor = CommitAuthor(name: "John")
    override func setUpWithError() throws {
        viewModel = HomeCellViewModel(commitAuthor: commitAuthor)
    }

    func testName() throws {
        XCTAssertEqual(viewModel?.name, commitAuthor.name)
    }

}

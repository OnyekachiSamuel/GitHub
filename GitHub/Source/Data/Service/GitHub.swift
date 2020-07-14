//
//  GitHub.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public struct GitHub {
    public static let baseURL = URL(string: "https://api.github.com/repos/rails/rails/commits")!
    public static var api : APIClient = {
        let configuration = URLSessionConfiguration.default
        return APIClient(configuration: configuration)
    }()
}

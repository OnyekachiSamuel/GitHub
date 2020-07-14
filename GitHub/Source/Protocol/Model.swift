//
//  Model.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public protocol Model: Codable {
    static var decoder: JSONDecoder { get }
}

public extension Model {
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
}

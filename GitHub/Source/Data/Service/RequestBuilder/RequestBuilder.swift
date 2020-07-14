//
//  RequestBuilder.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public protocol RequestBuilder {
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    func toURLRequest() -> URLRequest
}

extension RequestBuilder {
    func toURLRequest() -> URLRequest {
        let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)
        let url = components!.url!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue.uppercased()
        return request
    }
}

//
//  APIClient.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public struct APIClient: APIClientProtocol {
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration = .default) {
        session = URLSession(configuration: configuration)
    }
    
    func send(request: Request) {
        let urlRequest = request.builder.toURLRequest()
        let task = session.dataTask(with: urlRequest) { data, response, error in
            let result: Result<Data, APIError>
            result = .success(data ?? Data())
            DispatchQueue.main.async {
                request.completion(result)
            }
        }
        task.resume()
    }
}

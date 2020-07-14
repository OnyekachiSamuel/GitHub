//
//  Request.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case custom(String)
}

public struct Request {
    let builder: RequestBuilder
    let completion: (Result<Data, APIError>) -> Swift.Void
    init(builder: RequestBuilder, completion: @escaping (Result<Data, APIError>) -> Swift.Void) {
        self.builder = builder
        self.completion = completion
    }
    
    public static func basic(method: HTTPMethod = .get, baseURL: URL, completion: @escaping (Result<Data, APIError>) -> Void) -> Request {
        let builder = BasicRequestBuilder(method: method, baseURL: baseURL)
        return Request(builder: builder, completion: completion)
    }
}

extension Request {
    static func fetchCommits(completion: @escaping (Result<[UserCommit], APIError>) -> Swift.Void) -> Request {
        return Request.basic(baseURL: GitHub.baseURL) { result in
            result.decoding(UserCommit.self, completion: completion)
        }
    }
}

public extension Result where Success == Data, Failure == APIError {
    func decoding<M: Model>(_ model: M.Type, completion: @escaping (Result<[M], APIError>) -> Void) {
        DispatchQueue.global().async {
            let result = self.flatMap { data -> Result<[M], APIError> in
                do {
                    let decoder = M.decoder
                    let model = try decoder.decode([M].self, from: data)
                    return .success(model)
                } catch {
                    return .failure(APIError.custom(error.localizedDescription))
                }
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

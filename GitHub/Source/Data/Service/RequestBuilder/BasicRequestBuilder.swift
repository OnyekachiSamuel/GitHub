//
//  BasicRequestBuilder.swift
//  GitHub
//
//  Created by Onyekachi Ezeoke on 14/07/2020.
//  Copyright © 2020 Onyekachi Ezeoke. All rights reserved.
//

import Foundation

struct BasicRequestBuilder: RequestBuilder {
    var method: HTTPMethod
    var baseURL: URL
}

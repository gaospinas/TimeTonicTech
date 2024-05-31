//
//  RequestError.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

enum RequestError: Error, Equatable {
    case noUserHeaders
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
}

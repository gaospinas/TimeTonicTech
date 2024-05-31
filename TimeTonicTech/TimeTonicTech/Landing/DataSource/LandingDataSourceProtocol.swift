//
//  LandingDataSourceProtocol.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

protocol LandingDataSourceProtocol {
    func allBooks() async -> Result<AllBooksModel, RequestError>
}

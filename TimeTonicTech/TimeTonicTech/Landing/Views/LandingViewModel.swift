//
//  LandingViewModel.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 29/05/24.
//

import Foundation

@MainActor
class LandingViewModel: ObservableObject {
    
    @Published var bookList: [Book] = []
    var landingDataSource: LandingDataSourceProtocol
    
    init() {
        landingDataSource = LandingDataSource()
        Task {
            await fetchBookList()
        }
    }
    
    func fetchBookList() async {
        let result = await landingDataSource.allBooks()
        if case .success(let success) = result {
            // Filtrar libros que no son "contact books"
            bookList = success.allBooks?.books?.filter { !($0.defaultTemplate?.contains("contact") ?? false) } ?? []
        }
    }
}

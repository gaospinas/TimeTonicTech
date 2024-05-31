//
//  LandingDataSource.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

class LandingDataSource: LandingDataSourceProtocol {
    
    func allBooks() async -> Result<AllBooksModel, RequestError> {
        
        let req = "getAllBooks"
        var values = self.getValues()

        guard let oU = values.oU, let sesskey = values.sesskey else {
            return .failure(.unauthorized)
        }
       
        guard let url = URL(string: "https://timetonic.com//live/api.php?req=\(req)&o_u=\(oU)&u_c=\(oU)&sesskey=\(sesskey)") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(AllBooksModel.self, from: data)
            return .success(decoder)
        } catch {
            return .failure(.unknown)
        }
    }

    // Function to get the values from user default
    private func getValues() -> (oU: String?, sesskey: String?) {
        let defaults = UserDefaults.standard
        let oU = defaults.string(forKey: "o_u")
        let sesskey = defaults.string(forKey: "sesskey")
        return (oU, sesskey)
    }
}

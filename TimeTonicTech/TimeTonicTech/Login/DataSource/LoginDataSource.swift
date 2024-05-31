//
//  LoginDataSource.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

class LoginDataSource: LoginDataSourceProtocol {
    
    func appKey() async -> Result<AppKeyModel, RequestError> {
        
        let req = "createAppkey"
        let appname = "api"
        
        guard let url = URL(string: "https://timetonic.com//live/api.php?req=\(req)&appname=\(appname)") else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(AppKeyModel.self, from: data)
            return .success(decoder)
        } catch {
            return .failure(.unknown)
        }
    }
    
    func userLogin(login: String, password: String, appKey: String) async -> Result<UserLoginModel, RequestError> {
        
        let req = "createOauthkey"
        
        guard let url = URL(string: "https://timetonic.com//live/api.php?req=\(req)&login=\(login)&pwd=\(password)&appkey=\(appKey)") else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(UserLoginModel.self, from: data)
            return .success(decoder)
        } catch {
            return .failure(.unknown)
        }
    }
    
    func createSesskey(oauthKey: String) async -> Result<CreateSesskeyModel, RequestError> {
        
        let req = "createSesskey"
        let o_u = "androiddeveloper"
        
        guard let url = URL(string: "https://timetonic.com//live/api.php?req=\(req)&oauthkey=\(oauthKey)&o_u=\(o_u)") else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(CreateSesskeyModel.self, from: data)
            return .success(decoder)
        } catch {
            return .failure(.unknown)
        }
    }
    
    func saveValues(a: String, b: String) {
        let defaults = UserDefaults.standard
        defaults.set(a, forKey: "o_u")
        defaults.set(b, forKey: "sesskey")
    }
}

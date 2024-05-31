//
//  LoginDataSourceProtocol.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

protocol LoginDataSourceProtocol {
    func appKey() async -> Result<AppKeyModel, RequestError>
    func userLogin(login: String, password: String, appKey: String) async -> Result<UserLoginModel, RequestError>
    func createSesskey(oauthKey: String) async -> Result<CreateSesskeyModel, RequestError>
    func saveValues(a: String, b: String)
}

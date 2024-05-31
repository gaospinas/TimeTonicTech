//  LoginViewModel.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 29/05/24.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var username: String = "android.developer@timetonic.com"
    @Published var password: String = "Android.developer1"
    @Published var isLoggedIn: Bool = false
    @Published var showingAlert: Bool = false
    var incorrectCredentialMessage: String = "Username or password is incorrect"
    var noCredentialMessage: String = "Please add credentials"
    var typeOfMessage: Int = 0
    var loginDataSource: LoginDataSourceProtocol
    
    init() {
        loginDataSource = LoginDataSource()
    }
    
    func login() async {
      
        if self.username != "" && self.password != "" {
            let result = await loginDataSource.appKey()
            
            if case .success(let success) = result {
               let result2 = await loginDataSource.userLogin(login: username, password: password, appKey: success.appkey ?? "")
                
                if case .success(let success2) = result2 {
                    let result3 = await loginDataSource.createSesskey(oauthKey: success2.oauthkey ?? "")
                    
                    if case .success(let success3) = result3 {
                        loginDataSource.saveValues(a: success2.oU ?? "", b: success3.sesskey ?? "")
                    } else {
                        self.showingAlert = true
                        self.typeOfMessage = 0
                    }
                } else {
                    self.showingAlert = true
                    self.typeOfMessage = 0
                }
            } else {
                self.showingAlert = true
                self.typeOfMessage = 0
            }

            self.isLoggedIn = true
        } else {
            self.showingAlert = true
            self.typeOfMessage = 1
        }
    }
}


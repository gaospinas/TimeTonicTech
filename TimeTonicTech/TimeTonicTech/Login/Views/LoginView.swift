//  LoginView.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 29/05/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginHeaderView()
                loginTextInputsView()
                loginButtonsView()
            }
            .padding()
            .navigationDestination(isPresented: $vm.isLoggedIn) {
                MainTabView()
                    .navigationBarBackButtonHidden(true)
            }
            .alert(isPresented: $vm.showingAlert) {
                Alert(title: Text("Invalid Login"), message: Text(vm.typeOfMessage == 1 ? vm.noCredentialMessage : vm.incorrectCredentialMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

extension LoginView {
    
    private func loginTextInputsView() -> some View {
        VStack(alignment: .leading) {
            TextField("Enter your email", text: $vm.username)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
            SecureField("Password", text: $vm.password)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5)
                .padding(.bottom, 20)
        }
        .padding()
    }
    
    private func loginButtonsView() -> some View {
        VStack(spacing: 16) {
            Button(action: {
                Task {
                    await vm.login()
                }
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Color.mint)
                    .padding(.horizontal, 16)
                    .cornerRadius(5)
                    .foregroundStyle(Color.black)
            }
        }
    }
}

#Preview {
    LoginView()
}

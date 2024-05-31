//  AppContext.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 29/05/24.
//

import SwiftUI

struct YourApp: App {
    @StateObject private var appContext = AppContext()

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(appContext)
        }
    }
}

class AppContext: ObservableObject {
    // Aquí puedes manejar datos globales de la aplicación
}

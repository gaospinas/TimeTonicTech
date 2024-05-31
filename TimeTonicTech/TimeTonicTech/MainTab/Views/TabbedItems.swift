//
//  TabbedItems.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

enum TabbedItems: Int, CaseIterable {
    case landing = 0
    case preferences = 1
    
    
    var title: String {
        switch self {
        case .landing:
            return "Landing"
        case .preferences:
            return "preferences"
        }
    }
    
    var iconName: String {
        switch self {
        case .landing:
            return "Landing"
        case .preferences:
            return "star"
        }
    }
}


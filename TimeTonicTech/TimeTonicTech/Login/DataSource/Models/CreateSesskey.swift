//
//  CreateSesskey.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

// MARK: - CreateSesskeyModel
struct CreateSesskeyModel: Codable {
    var status: String?
    var sesskey: String?
    var id: String?
    var restrictions: Restrictions?
    var appName: String?
    var createdVNB: String?
    var req: String?
}

// MARK: - Restrictions
struct Restrictions: Codable {
    var carnetCode: String?
    var carnetOwner: String?
    var readonly: Bool?
    var hideTables: Bool?
    var hideMessages: Bool?
    var hideEvents: Bool?
    var restrictionsInternal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case carnetCode = "carnet_code"
        case carnetOwner = "carnet_owner"
        case readonly, hideTables, hideMessages, hideEvents
        case restrictionsInternal = "internal"
    }
}

//
//  UserLoginModel.swift
//  TimetonicBooks
//
//  Created by Gustavo Ospina on 30/05/24.
//

import Foundation

// MARK: - AppKeyModel
struct UserLoginModel: Codable {
    var status: String?
    var oauthkey: String?
    var id: String?
    var oU: String?
    var createdVNB: String?
    var req: String?

    enum CodingKeys: String, CodingKey {
        case status, oauthkey, id
        case oU = "o_u"
        case createdVNB, req
    }
}

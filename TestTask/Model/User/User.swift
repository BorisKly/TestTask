//
//  UsersData.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, email, phone: String
    let position: UserPosition
    let positionID, registrationTimestamp: Int
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
}

enum UserPosition: String, Codable {
    case contentManager = "Content manager"
    case designer = "Designer"
    case lawyer = "Lawyer"
}

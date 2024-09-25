//
//  TokenResponseData.swift
//  TestTask
//
//  Created by Borys Klykavka on 25.09.2024.
//

import Foundation

// MARK: - Welcome
struct TokenResponseData: Codable {
    let success: Bool
    let token: String
}

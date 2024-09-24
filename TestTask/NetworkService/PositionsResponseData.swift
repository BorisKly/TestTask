//
//  PositionsResponseData.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation

// MARK: - Welcome
struct PositionsResponseData: Codable {
    let success: Bool
    let positions: [ResponsePosition]
}

// MARK: - Position
struct ResponsePosition: Codable {
    let id: Int
    let name: String
}

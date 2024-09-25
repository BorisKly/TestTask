//
//  NetworkApiMethods.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation

enum NetworkApiMethods: String {
    
    case users = "users"
    case positions = "positions"
    case token = "token" 
//    case airPollution = "air_pollution"
    
    var path: String {
        let generalPath = #"/api/v1/"#
        return generalPath+self.rawValue
    }
    
}

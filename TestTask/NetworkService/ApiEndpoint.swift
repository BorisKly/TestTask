//
//  ApiEndpoint.swift
//  TestTask
//
//  Created by Borys Klykavka on 24.09.2024.
//

import Foundation


enum APIEndpoints: String, CaseIterable {
    
    case users = "users"
    
    var path: String {
        let generalPath = #"/v1/"#
        return generalPath+self.rawValue
    }

}




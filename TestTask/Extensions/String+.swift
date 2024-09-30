//
//  String+.swift
//  TestTask
//
//  Created by Borys Klykavka on 30.09.2024.
//

import SwiftUI

extension String {
    
    func formatPhoneNumber() -> String {
        let digits = self.filter { "0123456789".contains($0) }
        guard digits.count == 12 else {
            return self
        }
        let formattedNumber = "+\(digits.prefix(2)) (\(digits.dropFirst(2).prefix(3))) \(digits.dropFirst(5).prefix(3)) \(digits.dropFirst(8).prefix(2)) \(digits.suffix(2))"
        return formattedNumber
    }

}




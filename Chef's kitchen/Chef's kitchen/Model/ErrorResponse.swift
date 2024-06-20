//
//  ErrorResponse.swift
//  Chef's kitchen
//
//  Created by KhuePM on 12/06/2024.
//

import Foundation

struct ErrorResponse: Codable, LocalizedError {
    let status: Int
    let error: String
    
    var errorDescription: String? {
        return NSLocalizedString(self.error, comment: "")
    }
}

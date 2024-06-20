//
//  AlertContent.swift
//  Chef's kitchen
//
//  Created by KhuePM on 12/06/2024.
//

import Foundation

struct AlertContent: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let message: String
}

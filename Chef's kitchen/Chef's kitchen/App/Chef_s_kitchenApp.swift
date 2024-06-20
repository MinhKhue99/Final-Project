//
//  Chef_s_kitchenApp.swift
//  Chef's kitchen
//
//  Created by KhuePM on 10/06/2024.
//

import SwiftUI

@main
struct Chef_s_kitchenApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MealViewModel.shared)
        }
    }
}

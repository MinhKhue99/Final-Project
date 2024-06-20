//
//  MealViewModel.swift
//  Chef's kitchen
//
//  Created by KhuePM on 12/06/2024.
//

import Foundation
import SwiftUI

class MealViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var alert: AlertContent?
    @Published var categories = [Category]()
    @Published var meals = [Meal]()
    @Published var searchMealResult = [Meal]()
    public var placeholders = Array(repeating: Meal(), count: 10)
    static let shared = MealViewModel()
    
    init() {
        getAllCategories()
    }
    
    func getAllCategories() {
        self.isLoading = true
        MealService.getAllCategories() {categories, error in
            guard let categories = categories else {
                self.isLoading = false
                self.alert = AlertContent(title: "Get category fail", message: error?.localizedDescription ?? "")
                return
            }
            self.categories = categories
            self.isLoading = false
        }
    }
    
    func getMealsByCategory(category: String) {
        self.isLoading = true
        MealService.getMealsByCategory(category: category) {meals, error in
            guard let meals = meals else {
                self.isLoading = false
                self.alert = AlertContent(title: "Get meals fail", message: error?.localizedDescription ?? "")
                return
            }
            self.meals = meals
            self.isLoading = false
        }
    }
    
    func searchMeal(name: String) {
        self.isLoading = true
        MealService.searchMeal(name: name) {meals, error in
            guard let meals = meals else {
                self.isLoading = false
                self.alert = AlertContent(title: "Get meals fail", message: error?.localizedDescription ?? "")
                return
            }
            self.searchMealResult = meals
            self.isLoading = false
        }
    }
}

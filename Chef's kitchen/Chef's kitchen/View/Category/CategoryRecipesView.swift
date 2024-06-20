//
//  CategoryRecipesView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 17/06/2024.
//

import SwiftUI

struct CategoryRecipesView: View {
    // MARK:  Property
    @EnvironmentObject var mealViewModel: MealViewModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack {
                ForEach(mealViewModel.meals, id: \.idMeal) { recipe in
                    
                    NavigationLink(
                        destination: RecipeDetailView(meal: recipe),
                        label: {
                            CategoryView(meal: recipe)
                        })
                }
            }
        }
        
    }
}

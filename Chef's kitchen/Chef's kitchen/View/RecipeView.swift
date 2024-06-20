//
//  RecipeView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 11/06/2024.
//

import SwiftUI

struct RecipeView: View {
    // MARK:  Property
    var recipe: Meal
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 8) {
                Text(recipe.strMeal ?? "")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .redacted(reason: recipe.strMeal == nil ? .placeholder : .init())
                    .lineLimit(1)
                
                Text(recipe.strCategory ?? "")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.gray)
                    .redacted(reason: recipe.strCategory == nil ? .placeholder : .init())
                
            }
            .padding(.top)
            .padding(.leading)
            
            Spacer()
            
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: recipe.strMealThumb ?? "")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                        .redacted(reason: recipe.strMealThumb == nil ? .placeholder : .init())
                        .frame(maxWidth: 100, alignment: .center)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
    }
}

#Preview {
    RecipeView(recipe: Meal(idMeal: "52772", strMeal: "Teriyaki Chicken Casserole", strCategory: "Chicken", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"))
}

//
//  CategoryView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 20/06/2024.
//

import SwiftUI

struct CategoryView: View {
    var meal: Meal
    
    var body: some View {
            VStack(spacing: 12) {
                if meal.strMealThumb != nil{
                    AsyncImage(url: URL(string: meal.strMealThumb ?? "")!) { img in
                        img
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height:  300)
                         
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: .black.opacity(0.4), radius: 2, x: -8, y: 5)
                           
                            .overlay {
                                LinearGradient(colors: [.clear, .black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                                    .cornerRadius(12)
                            }//: overlay-
                            .overlay(alignment: .bottomLeading) {
                                Text(meal.strMeal ?? "")
                                    .multilineTextAlignment(.leading)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 120)
                                    .padding(.leading, 8)
                                    .padding(.bottom, 20)
                            }//: overlay
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200, height:  300)
                    }
                } else {
                    Image(systemName: "photo.artframe")
                        .imageScale(.large)
                }//: if else -asyncImage
            }//: VStack
           
            .padding()
    }
}

#Preview {
    CategoryView(meal: Meal(idMeal: "52772", strMeal: "Teriyaki Chicken Casserole", strCategory: "Chicken", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"))
}

//
//  SearchView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 16/06/2024.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var mealViewModel: MealViewModel
    @Binding var name: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                HStack {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.gray)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    })
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Search result")
                        .font(.system(size: 29, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                if !mealViewModel.searchMealResult.isEmpty {
                    VStack {
                        ForEach(mealViewModel.searchMealResult, id: \.idMeal) { recipe in
                            NavigationLink(
                                destination: RecipeDetailsView(meal: recipe),
                                label: {
                                    RecipeView(recipe: recipe)
                                }
                            )
                        }
                    }
                } else {
                    Text("No results")
                        .font(.system(size: 21, weight: .semibold))
                        .foregroundColor(Color.gray)
                        .padding(.top)
                }
                
                Spacer()
            }
        })
        .navigationBarHidden(true)
        .onAppear {
            mealViewModel.searchMeal(name: self.name)
        }
    }
}

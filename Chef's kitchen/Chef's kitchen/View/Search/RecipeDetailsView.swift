//
//  RecipeDetailsView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 11/06/2024.
//

import SwiftUI

struct RecipeDetailsView: View {
    var meal: Meal
    @Environment(\.presentationMode) var presentation
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var body: some View {
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: meal.strMealThumb ?? "Loading...")!) { image in
                        image
                            .resizable()
                            .foregroundColor(.gray)
                            .redacted(reason: meal.strMealThumb == nil ? .placeholder : .init())
                            .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.width)
                            .overlay(
                                ZStack {
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
                                            })
                                            
                                            Spacer()
                                            
                                            Button(action: {}, label: {
                                                Image(systemName: "bookmark.fill")
                                                    .foregroundColor(Color.green)
                                                    .padding()
                                                    .background(Color.white)
                                                    .clipShape(Circle())
                                            })
                                        }
                                        .padding(.horizontal)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, safeAreaInsets.top)
                                    
                                   
                                }
                            )
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                ScrollView(.vertical, showsIndicators: false, content: {
                VStack {
                    VStack {
                        Capsule()
                            .frame(width: 80, height: 4)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .padding(.top)
                        
                        HStack {
                            Text(meal.strCategory ?? "Loading...")
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .textCase(.uppercase)
                                .foregroundColor(.green)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.green.opacity(0.15))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Text(meal.strMeal ?? "Loading...")
                                .font(.system(size: 29, weight: .bold))
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        HStack(spacing: 8) {
                            Text("by")
                            
                            Text("Raphael Cerqueira")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text("12 ingredients")
                        }
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                        .padding(.horizontal)
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text("4.7")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                            Text("(422 reviews)")
                                .foregroundColor(.gray)
                            
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                                .padding(.leading)
                            
                            Text("14 minutes")
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    .background(Color.white)
                    
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .font(.system(size: 23, weight: .bold))
                            
                            Spacer()
                            
                            Text("1 serving")
                                .fontWeight(.bold)
                                .foregroundColor(Color.green)
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                        
                        ForEach(0..<10) { i in
                            if meal["strIngredient\(i)"] != nil && meal["strIngredient\(i)"] != "" {
                                VStack {
                                    HStack {
                                        Text(meal["strIngredient\(i)"] ?? "Loading...")
                                        
                                        Spacer()
                                        
                                        Text(meal["strMeasure\(i)"] ?? "Loading...")
                                            .fontWeight(.bold)
                                    }
                                    .padding(.vertical)
                                    
                                    Divider()
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        if meal.strYoutube == "" {
                            EmptyView()
                        } else {
                            NavigationLink(destination: YoutubeView(strYoutube: meal.strYoutube), label: {
                                Text("Start Cooking")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            })
                            .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                            .background(Color.green)
                            .cornerRadius(5)
                            .padding(.horizontal)
                        }
                    }
                    .background(Color.white)
                }
                .background(Color.gray.opacity(0.3))
                .cornerRadius(30)
                .offset(y: -30)
                })
            }
        .navigationBarHidden(true)
        .ignoresSafeArea(.all, edges: .all)
    }
}

#Preview {
    RecipeDetailsView(meal: Meal(idMeal: "52772", strMeal: "Teriyaki Chicken Casserole", strCategory: "Chicken", strMealThumb: "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"))
}

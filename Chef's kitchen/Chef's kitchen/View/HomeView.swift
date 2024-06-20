//
//  HomeView.swift
//  Chef's kitchen
//
//  Created by KhuePM on 14/06/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK:  Property
    @EnvironmentObject var mealViewModel: MealViewModel
    @State var name = ""
    @State var selectedCategory = "Beef"
    @State var selectedIndex = 1
    @Namespace var animation
    @State var showSearchResult = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                headerView
                
                Divider()
                    .padding(.top, 8)
                
                ScrollView(.vertical, showsIndicators: true) {
                    searchView
                    categoriesView
                    CategoryRecipesView()
                }
            }
            .navigationBarHidden(true)
        }
        .onChange(of: self.selectedCategory, perform: { newCaterogy in
            mealViewModel.getMealsByCategory(category: newCaterogy)
        })
        .task {
            mealViewModel.getMealsByCategory(category: self.selectedCategory)
        }
    }
}

extension HomeView {
    // MARK:  headerView
    private var headerView: some View {
        ZStack {
            HStack {
                
                Spacer()
                
                Button(action: {
                    // MARK:  Todo
                }, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 19, weight: .bold))
                        .foregroundColor(Color.black)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .background(Circle().strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
                })
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("Chef's ")
                    .font(.system(size: 27, weight: .bold))
                
                Text("kitchen")
                    .font(.system(size: 27))
            }
        }
    }
    
    private var searchView: some View {
        VStack(alignment: .leading) {
            Text("What do you want to\ncook today?")
                .font(.system(size: 27, weight: .bold))
                .padding(.top, 30)
                .padding(.leading)
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 27, weight: .bold))
                    .foregroundColor(.gray)
                
                TextField("Try 'Salad'",
                          text: $name,
                          onCommit: {
                    showSearchResult = true
                    self.name = ""
                })
                .font(.system(size: 21))
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray.opacity(0.3), lineWidth: 1))
            .padding(.top)
            .padding(.horizontal)
            .navigationDestination(isPresented: $showSearchResult, destination: {SearchView(name: $name)})
            
        }
    }
    
    private var categoriesView: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    ForEach(mealViewModel.categories, id: \.self.idCategory){ category in
                        Button(action: {
                            withAnimation {
                                selectedIndex = Int(category.idCategory ?? "1") ?? 1
                                selectedCategory = category.strCategory ?? "Beef"
                                mealViewModel.getMealsByCategory(category: selectedCategory)
                            }
                        }, label: {
                            VStack {
                                Text(category.strCategory ?? "")
                                    .font(.system(size: selectedCategory == category.strCategory ? 19 : 17, weight:  selectedCategory == category.strCategory ? .bold : .regular))
                                    .foregroundColor(selectedCategory == category.strCategory ? .black : .gray)
                                
                                ZStack {
                                    if selectedCategory == category.strCategory {
                                        Capsule()
                                            .fill(Color(#colorLiteral(red: 0.02946649678, green: 0.6407182813, blue: 0.3381308317, alpha: 1)))
                                            .frame(height: 4)
                                            .matchedGeometryEffect(id: "category", in: animation)
                                    }
                                }
                            }
                        })
                    }
                }
                .padding(.horizontal)
                
            }
            .padding(.top)
            
            
            Divider()
        }
    }
}

//
//  AllCategoriesResponse.swift
//  Chef's kitchen
//
//  Created by KhuePM on 11/06/2024.
//

import Foundation

struct Category: Codable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}

struct CategoryResponse: Codable {
    let categories: [Category]
}

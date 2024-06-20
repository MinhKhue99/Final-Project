//
//  MealService.swift
//  Chef's kitchen
//
//  Created by KhuePM on 10/06/2024.
//

import Foundation

struct MealService {
    
    // MARK:  get all category
    static func getAllCategories(completionHandler: @escaping([Category]?, Error?) -> Void) {
        var request = URLRequest(url: Endpoints.getCategories.url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, taskError in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    debugPrint(error)
                    DispatchQueue.main.async {
                        completionHandler(nil, taskError)
                    }
                }
                return
            }
            
            
            do {
                let responseData = try JSONDecoder().decode(CategoryResponse.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseData.categories, nil)
                }
            } catch {
                debugPrint(error)
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
            }
            
            
        }.resume()
        
    }
    
    
    // MARK:  get all meal of category
    static func getMealsByCategory(category: String, completionHandler: @escaping([Meal]?, Error?) -> Void) {
        var request = URLRequest(url: Endpoints.getMealsByCategory(category: category).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, taskError in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    debugPrint(error)
                    DispatchQueue.main.async {
                        completionHandler(nil, taskError)
                    }
                }
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseData.meals, nil)
                }
            } catch {
                debugPrint(error)
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
            }
            
        }.resume()
    }
    
    
    // MARK:  search meal by name
    static func searchMeal(name: String, completionHandler: @escaping([Meal]?, Error?) -> Void) {
        var request = URLRequest(url: Endpoints.searchMealByName(name: name).url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: request) { data, response, taskError in
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
                return
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                do {
                    let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(nil, errorResponse)
                    }
                } catch {
                    debugPrint(error)
                    DispatchQueue.main.async {
                        completionHandler(nil, taskError)
                    }
                }
                return
            }
            
            do {
                let responseData = try JSONDecoder().decode(MealResponse.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(responseData.meals, nil)
                }
            } catch {
                debugPrint(error)
                DispatchQueue.main.async {
                    completionHandler(nil, taskError)
                }
            }
            
        }.resume()
    }
}

//
//  RestaurantViewModel.swift
//  MVVMRxSwift
//
//  Created by 田川　裕隆 on 2021/06/20.
//

import Foundation

struct RestaurantViewModel {
    
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}

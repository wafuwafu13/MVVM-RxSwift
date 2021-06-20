//
//  RestaurantsListViewModel.swift
//  MVVMRxSwift
//
//  Created by 田川　裕隆 on 2021/06/20.
//

import Foundation
import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantServiceProtocol = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map { $0.map {
            RestaurantViewModel(restaurant: $0)
        } }
    }
}

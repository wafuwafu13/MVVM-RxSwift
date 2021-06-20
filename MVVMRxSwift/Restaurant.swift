//
//  Restaurant.swift
//  MVVMRxSwift
//
//  Created by 田川　裕隆 on 2021/06/20.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case european
    case indian
    case mexican
    case french
    case english
}

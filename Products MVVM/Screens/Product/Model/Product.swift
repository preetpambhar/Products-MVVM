//
//  Product.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-03.
//

import Foundation

struct Product: Decodable{
    let id: Int
    let title : String
    let price : Double
    let description : String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable{
    let rate: Double
    let count: Int
}

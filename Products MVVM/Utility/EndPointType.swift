//
//  EndPointType.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-04.
//

import Foundation


enum HTTPMethods: String {
    case get = "Get"
    case  post = "Post"
}


protocol EndPointType{
    var path: String{ get }
    var baseUrl: String{ get }
    var url: URL? {get}
    var method: HTTPMethods{ get }
}


enum EndPointItems {
    case products  //Module
}

//https://fakestoreapi.com/products
extension EndPointItems: EndPointType{
    var path: String {
        switch self {
        case.products:
            return "products"
        }
    }
    
    var baseUrl: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HTTPMethods {
        switch self{
        case .products:
            return .get
        }
    }
    
    
}

//
//  APIManager.swift
//  Products MVVM
//
//  Created by Preet Pambhar on 2024-05-03.
//

import UIKit


//Singleton design pattern
//final class - inheritance nahi hoga


enum  DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}
typealias Handler<T> = (Result<T, DataError>) -> Void

typealias preet = String


final class APIManager{
    static let shared = APIManager()
    private init(){ }
    var name: preet?
    
    func request<T: Decodable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler <T>
    ){
        guard let  url = type.url else {
                   completion(.failure(.invalidURL))
                   return
               }
       
               //Background task
               URLSession.shared.dataTask(with: url) { data, response, error in
                   guard let data, error == nil else{
                       completion(.failure(.invalidData))
                       return
                   }
       
                   guard let response  = response as? HTTPURLResponse,
                         200...299 ~= response.statusCode else {
                       completion(.failure(.invalidResponse))
                       return
                   }
                   //JSONDecoder() - Data ka model (Array)main convert karega
                   do {
                       let products = try JSONDecoder().decode(modelType, from: data)
                       completion(.success(products))
                   } catch {
                       completion(.failure(.network(error)))
                   }
               }.resume()
    }
//    func fetchProducts(completion: @escaping Handler){
//        guard let  url = URL(string: Constant.API.productURL) else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        //Background task 
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data, error == nil else{
//                completion(.failure(.invalidData))
//                return
//            }
//            
//            guard let response  = response as? HTTPURLResponse,
//                  200...299 ~= response.statusCode else {
//                completion(.failure(.invalidResponse))
//                return
//            }
//            //JSONDecoder() - Data ka model (Array)main convert karega
//            do {
//                let products = try JSONDecoder().decode([Product].self, from: data)
//                completion(.success(products))
//            } catch {
//                completion(.failure(.network(error)))
//            }
//        }.resume()
//        print("Ended")
//    }
}


//class A: APIManager{
//
//    override func temp() {
//
//
//    }
//    func configuration(){
//        let manager = APIManager()
//        manager.temp()
//
//        //APIManager.temp()
//        APIManager.shared.temp()
//    }
//}


//singleton - singleton class ka object create hoga outside of the class
//Singleton - singleton class ka object create nahi hoga outside of the class

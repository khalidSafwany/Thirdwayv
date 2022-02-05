//
//  ProductsService.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/30/22.
//

import Foundation

struct ProductsService {
    func getProductsFromApi( completion: @escaping (Data?, Error?) -> () ){

            let urlRequest = URL(string: Urls.getProductsURL)
            URLSession.shared.dataTask(with: urlRequest!) { (data, response, error) in
                
               
                if error != nil {
                    print(error!)
                    completion(nil, error)
                    return
                }
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                
                completion(data, nil)
                
            
            }.resume()
            
            
            
        }
    }


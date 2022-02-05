//
//  Product.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/30/22.
//

import Foundation


struct Product: Codable{
    
    var id: Int?
    var productDescription: String?
    var image: ImageModel?
    var price: Int?
    
    
    struct ImageModel: Codable {
        var height: Int?
        var width: Int?
        var url: String?
        
    }
    
}

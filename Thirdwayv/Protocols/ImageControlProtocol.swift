//
//  ImageControlProtocol.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/2/22.
//

import Foundation
import UIKit

protocol ImageControlProtocol {
    func getImage(imageURL: URL)
    func downloadImage(imageURL: URL)
    func laodImageFromCache(imageURL: URL) 
}

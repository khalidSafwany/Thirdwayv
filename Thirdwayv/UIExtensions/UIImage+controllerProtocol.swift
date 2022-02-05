//
//  UIImage+controllerProtocol.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/2/22.
//

import Foundation
import UIKit

class customImage: UIImageView, ImageControlProtocol{
    
    let cache = URLCache.shared
    
    func getImage(imageURL: URL) {
        //let imagePath = imageURL.path
        let request = URLRequest(url: imageURL)
        
        if self.cache.cachedResponse(for: request) != nil{
            return self.laodImageFromCache(imageURL: imageURL)
        } else {
            return self.downloadImage(imageURL: imageURL)
        }
    }
    
    func downloadImage(imageURL: URL) {
        let request = URLRequest(url: imageURL)
        
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: imageURL) {data, response, _ in
                                if let data = data {
                                    let cachedData = CachedURLResponse(response: response!, data: data)
                                    self.cache.storeCachedResponse(cachedData, for: request)
                                    DispatchQueue.main.async() { [weak self] in
                                        self?.contentMode = .scaleAspectFit
                                        self?.image = UIImage(data: data)
                                                }
                                }
                            }
                            dataTask.resume()
        }
    }
    
    func laodImageFromCache(imageURL: URL){
        let request = URLRequest(url: imageURL)
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = self.cache.cachedResponse(for: request)?.data, let image = UIImage(data: data){
                DispatchQueue.main.async { [weak self] in
                    self?.contentMode = .scaleAspectFit
                    self?.image = image                }
            }
        }
    }
    
    
    
    
    
}

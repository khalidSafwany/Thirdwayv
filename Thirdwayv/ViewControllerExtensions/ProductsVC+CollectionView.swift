//
//  ProductsVC+CollectionView.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 1/30/22.
//

import Foundation
import  UIKit

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return viewedProductsList?.count ?? 0
        return viewedProductsList?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: Strings.productCellIdentifier, for: indexPath) as?
            ProductsCollectionViewCell
        
        if let product = viewedProductsList?[indexPath.row]{
            productCell?.descriptionLabel.text = product.productDescription
            let productPrice = String(product.price!)
            productCell?.priceLabel.text = "\(productPrice) $"
            //productCell?.productImageView.downloadImage(from: product.image?.url ?? "")
            if let imageURL = URL(string: product.image?.url ?? ""){
            productCell?.productImageView.getImage(imageURL: imageURL)
            }
        }
        
        
       
        
        return productCell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        productsViewModel?.selectProductToShowDetails(productIndex: indexPath.row)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
            return  UIEdgeInsets(top: 0, left: 0 , bottom: 0, right: 0)

        
    }
    
}

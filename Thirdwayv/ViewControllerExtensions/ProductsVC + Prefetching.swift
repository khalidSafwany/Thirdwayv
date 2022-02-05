//
//  ProductsVC + Prefetching.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/1/22.
//

import Foundation
import UIKit

extension ProductsViewController: UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        if indexPaths.last?.row == (viewedProductsList?.count ?? 0) - 4{
            if !(productsViewModel?.getDataStatus())!{
            productsViewModel?.getProductsFromService(isPageOne: false)
            }
            
        }
    }
    
    
    
}

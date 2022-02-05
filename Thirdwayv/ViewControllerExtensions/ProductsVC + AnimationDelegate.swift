//
//  ProductsVC + AnimationDelegate.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/5/22.
//

import Foundation
import UIKit


extension ProductsViewController: UIViewControllerTransitioningDelegate{
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        guard
          let selectedIndexPathCell = ProductsCollectionView.indexPathsForSelectedItems,
            let selectedCell = ProductsCollectionView.cellForItem(at: selectedIndexPathCell.first!)
            as? ProductsCollectionViewCell,
          let selectedCellSuperview = selectedCell.superview
          else {
            return nil
        }

        transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
        transition.originFrame = CGRect(
          x: transition.originFrame.origin.x + 20,
          y: transition.originFrame.origin.y + 20,
          width: transition.originFrame.size.width - 40,
          height: transition.originFrame.size.height - 40
        )

        transition.presenting = true
//        selectedCell.shadowView.isHidden = true

        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil

    }
}

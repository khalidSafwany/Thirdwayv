//
//  PushAnimator.swift
//  Thirdwayv
//
//  Created by Khalid hassan on 2/5/22.
//

import Foundation
import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let duration = 0.8
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        let productDetailsView = presenting ? toView : transitionContext.view(forKey: .from)!
        
        let initialFrame = presenting ? originFrame : productDetailsView.frame
        let finalFrame = presenting ? productDetailsView.frame : originFrame

        let xScaleFactor = presenting ?
          initialFrame.width / finalFrame.width :
          finalFrame.width / initialFrame.width

        let yScaleFactor = presenting ?
          initialFrame.height / finalFrame.height :
          finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

        if presenting {
            productDetailsView.transform = scaleTransform
            productDetailsView.center = CGPoint(
            x: initialFrame.midX,
            y: initialFrame.midY)
            productDetailsView.clipsToBounds = true
        }

        productDetailsView.layer.cornerRadius = presenting ? 20.0 : 0.0
        productDetailsView.layer.masksToBounds = true



        containerView.addSubview(toView)
        containerView.bringSubviewToFront(productDetailsView)

        UIView.animate(
          withDuration: duration,
          delay:0.0,
          usingSpringWithDamping: 0.5,
          initialSpringVelocity: 0.2,
          animations: {
            productDetailsView.transform = self.presenting ? .identity : scaleTransform
            productDetailsView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
            productDetailsView.layer.cornerRadius = !self.presenting ? 20.0 : 0.0
          }, completion: { _ in
            transitionContext.completeTransition(true)
        })

    }
    
    
}

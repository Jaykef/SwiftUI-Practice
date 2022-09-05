//
//  MMPopAnimator.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/06/20.
//
//

import UIKit

class MMPopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var animating = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
    }
    
}

//
//  LoadingProgressView.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

class LoadingProgressView: UIView, CAAnimationDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
    }
    
}

class LoadingProgressViewLayer: CAShapeLayer {
    
}

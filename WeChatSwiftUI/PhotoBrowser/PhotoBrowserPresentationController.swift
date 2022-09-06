//
//  PhotoBrowserPresentationController.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/20.
//  Copyright © 2022 Jaward/Jaykef (苏杰). All rights reserved.
//

import UIKit

class PhotoBrowserPresentationController: UIPresentationController {
    
    var maskView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        guard let container = self.containerView else { return }
        
        container.addSubview(maskView)
        maskView.frame = container.bounds
        maskView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        maskView.alpha = 0.0
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.maskView.alpha = 1.0
        }, completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.maskView.alpha = 0.0
        }, completion: nil)
    }
}

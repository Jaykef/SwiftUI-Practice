//
//  SightCameraTouchDownView.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

class SightCameraTouchDownView: UIView {
    
    weak var target: NSObject?
    
    var callback: Selector?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
}

//
//  WXColor.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

// TODO: Adpat dark mode
extension UIColor {
    
    struct wx {
        
        static var isDark: Bool {
            return UIScreen.main.traitCollection.userInterfaceStyle == .dark
        }
        
        static var background: UIColor {
            return isDark ? .black: .white
        }
        
    }
    
}

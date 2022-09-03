//
//  Fonts.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

struct Fonts {
    
    enum WeChatFonts {
        case superScriptRegular
        case superScriptMedium
        case superScriptBold
        case regular
        case medium
        case bold
        
        var fontname: String {
            switch self {
            case .regular:
                return "WeChat-Sans-Regular"
            case .medium:
                return "WeChat-Sans-Medium"
            case .bold:
                return "WeChat-Sans-Bold"
            case .superScriptRegular:
                return "WeChat-Sans-SS-Regular"
            case .superScriptMedium:
                return "WeChat-Sans-SS-Medium"
            case .superScriptBold:
                return "WeChat-Sans-SS-Bold"
            }
        }
    }
    
    static func font(_ font: WeChatFonts, fontSize: CGFloat) -> UIFont? {
        return UIFont(name: font.fontname, size: fontSize)
    }
}

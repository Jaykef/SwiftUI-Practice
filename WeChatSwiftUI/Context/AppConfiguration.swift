//
//  AppConfiguration.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import Foundation

enum AppConfiguration: String {
    case debug
    case inhouse
    case release
    
    static func current() -> AppConfiguration {
        #if DEBUG
        return .debug
        #elseif INHOUSE
        return .inhouse
        #else
        return .release
        #endif
    }

}

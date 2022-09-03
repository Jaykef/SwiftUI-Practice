//
//  UserSettings.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import MMKV

class UserSettings {
    
    private struct Keys {
        static let chatBackgroundImage = "ChatBackground"
    }
    
    private let mmkv: MMKV
    
    init(userID: String) {
        let basePath = NSHomeDirectory().appending("/Documents/\(userID)/mmkv")
        mmkv = MMKV.init(mmapID: userID, relativePath: basePath)!
    }
    
    var globalBackgroundImage: String? {
        get {
            return mmkv.string(forKey: Keys.chatBackgroundImage)
        }
        set {
            if let value = newValue {
                mmkv.set(value, forKey: Keys.chatBackgroundImage)
            } else {
                mmkv.removeValue(forKey: Keys.chatBackgroundImage)
            }
        }
    }
    
}

//
//  AppContext.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import Foundation

class AppContext {
    
    static let current = AppContext()
    
    let userID: String
    
    let name: String
    
    let me: MockData.User
    
    let userSettings: UserSettings
    
    let momentCoverManager: MomentCoverManager
    
    let emoticonMgr = EmoticonManager()
    
    private init() {
        me = MockFactory.shared.user(with: "10001")!
        userID = me.identifier
        name = me.name
        userSettings = UserSettings(userID: userID)
        momentCoverManager =  MomentCoverManager(userID: userID)
    }
    
    func doHeavySetup() {
        DispatchQueue.global(qos: .background).async {
            self.emoticonMgr.setup()
        }
    }
}

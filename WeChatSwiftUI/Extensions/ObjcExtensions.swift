//
//  ObjcExtensions.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/02.
//

import UIKit

func synchronized(_ object: AnyObject, block: () -> Void) {
    objc_sync_enter(object)
    block()
    objc_sync_exit(object)
}
func synchronized<T>(_ object: AnyObject, block: () -> T) -> T {
    objc_sync_enter(object)
    let result: T = block()
    objc_sync_exit(object)
    return result
}

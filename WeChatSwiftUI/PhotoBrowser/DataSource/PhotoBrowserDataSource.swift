//
//  PhotoBrowserDataSource.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/20.
//  Copyright © 2022 Jaward/Jaykef (苏杰). All rights reserved.
//

import UIKit

protocol PhotoBrowserDataSource: UICollectionViewDataSource {
    
    var browser: PhotoBrowserViewController? { get set }
    
}

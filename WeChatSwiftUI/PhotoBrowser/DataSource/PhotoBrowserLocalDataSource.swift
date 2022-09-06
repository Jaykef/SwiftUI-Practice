//
//  PhotoBrowserLocalDataSource.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/20.
//  Copyright © 2022 Jaward/Jaykef (苏杰). All rights reserved.
//

import UIKit

class PhotoBrowserLocalDataSource: NSObject, PhotoBrowserDataSource {
    
    weak var browser: PhotoBrowserViewController?
    
    var numberOfItems: Int
    
    var images: [UIImage?]
    
    init(numberOfItems: Int, images: [UIImage?]) {
        self.numberOfItems = numberOfItems
        self.images = images
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(PhotoBrowserViewCell.self), for: indexPath) as! PhotoBrowserViewCell
        cell.imageView.image = images[indexPath.item]
        cell.setNeedsLayout()
        return cell
    }
}

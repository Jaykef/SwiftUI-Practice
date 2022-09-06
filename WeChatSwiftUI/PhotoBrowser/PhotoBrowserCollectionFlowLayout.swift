//
//  PhotoBrowserCollectionFlowLayout.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/20.
//  Copyright © 2022 Jaward/Jaykef (苏杰). All rights reserved.
//

import UIKit

class PhotoBrowserCollectionFlowLayout: UICollectionViewFlowLayout {
    
    var indexPathForFocusItem: IndexPath?
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        if let indexPath = indexPathForFocusItem {
            if let layoutAttrs = self.layoutAttributesForItem(at: indexPath),
                let collectionView = self.collectionView {
                return CGPoint(x: layoutAttrs.frame.origin.x - collectionView.contentInset.left,
                               y: layoutAttrs.frame.origin.y - collectionView.contentInset.top)
            }
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        } else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        }
    }
}

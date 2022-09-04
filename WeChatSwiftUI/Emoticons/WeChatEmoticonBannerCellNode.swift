//
//  WeChatEmoticonBannerCellNode.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/06/20.
//  Copyright © 2022 Jaykef. All rights reserved.
//

import AsyncDisplayKit

class WeChatEmoticonBannerCellNode: ASCellNode {
    
    private let imageNode = ASNetworkImageNode()

    init(banner: EmoticonBanner) {
        
        super.init()
        automaticallyManagesSubnodes = true
        
        imageNode.url = banner.iconUrl
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: imageNode)
    }
    
}

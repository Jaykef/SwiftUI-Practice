//
//  MomentCommentLineNode.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//  Copyright © 2022 Jaykef. All rights reserved.
//

import AsyncDisplayKit

class MomentCommentLineNode: ASDisplayNode {
    
    private let frontLine = ASDisplayNode()
    
    private let backLine = ASDisplayNode()
    
    override init() {
        super.init()
        frontLine.backgroundColor = UIColor(hexString: "#DDDEDF")
        backLine.backgroundColor = UIColor(hexString: "#F6F7F7")
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        frontLine.style.preferredSize = CGSize(width: constrainedSize.max.width, height: Constants.lineHeight)
        frontLine.style.layoutPosition = CGPoint(x: 0, y: 0)
        
        backLine.style.preferredSize = CGSize(width: constrainedSize.max.width, height: Constants.lineHeight)
        backLine.style.layoutPosition = CGPoint(x: 0, y: Constants.lineHeight)
        
        return ASAbsoluteLayoutSpec(children: [frontLine, backLine])
    }
}

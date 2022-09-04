//
//  MomentGroupTagCellNode.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//  Copyright © 2022 Jaykef. All rights reserved.
//

import AsyncDisplayKit

class MomentGroupTagCellNode: ASCellNode {
    
    private let titleNode = ASTextNode()
    
    private let descNode = ASTextNode()
    
    private let arrowNode = ASImageNode()
    
    private let lineNode = ASDisplayNode()
    
    init(groupTag: MomentGroupTag) {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        super.didLoad()
        
        backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let infoStack = ASStackLayoutSpec.vertical()
        infoStack.children = [titleNode, descNode]
        
        
        
        return ASLayoutSpec()
    }
    
}

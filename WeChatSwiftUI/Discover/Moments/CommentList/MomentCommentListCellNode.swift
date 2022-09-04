//
//  MomentCommentListCellNode.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//  Copyright © 2022 Jaykef. All rights reserved.
//

import AsyncDisplayKit

class MomentCommentListCellNode: ASCellNode {
    
    private let avatarNode = ASImageNode()
    
    private let nameButton = ASButtonNode()
    
    init(string: String) {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func didLoad() {
        super.didLoad()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASLayoutSpec()
    }
}

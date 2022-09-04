//
//  MomentKeyboardNode.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import AsyncDisplayKit
import WXGrowingTextView

class MomentKeyboardNode: ASDisplayNode {
    
    private let emoticonNode = ASButtonNode()
    
    override init() {
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

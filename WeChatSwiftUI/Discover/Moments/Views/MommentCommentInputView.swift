//
//  MommentCommentInputView.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit
import WXGrowingTextView

protocol MommentCommentInputView: class {
    
}

class MomentCommentInputView: UIView {
    
    private let textView: WXGrowingTextView
    
    private let emoticonButton: UIButton
    
    override init(frame: CGRect) {
        
        textView = WXGrowingTextView()
        textView.placeholder = "Comment"
        
        emoticonButton = UIButton(type: .custom)
        
        super.init(frame: frame)
        
        addSubview(textView)
        addSubview(emoticonButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

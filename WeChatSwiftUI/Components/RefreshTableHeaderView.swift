//
//  RefreshTableHeaderView.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

enum RefreshState {
    case pulling
    case normal
    case loading
}

protocol RefreshTableHeaderViewDelegate: class {
    func refreshTableHeaderViewDidTriggerRefresh(_ headerView: RefreshTableHeaderView)
}

class RefreshTableHeaderView: UIView {
    
    weak var delegate: RefreshTableHeaderViewDelegate?
    
    init(frame: CGRect, arrowImage: UIImage, textColor: UIColor) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshScrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}

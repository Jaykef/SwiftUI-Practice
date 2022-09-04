//
//  UIViewController+Extensions.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/02.
//

import UIKit

extension UIViewController {
    func wc_doneBarButton(title: String = "完成") -> UIButton {
        let doneButton = UIButton(type: .system)
        doneButton.layer.cornerRadius = 5
        doneButton.layer.masksToBounds = true
        doneButton.frame.size = CGSize(width: 56, height: 30)
        doneButton.backgroundColor = Colors.Brand
        doneButton.setBackgroundImage(UIImage(color: Colors.Brand_120), for: .disabled)
        doneButton.setBackgroundImage(UIImage(color: Colors.Brand), for: .normal)
        doneButton.setTitle(title, for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return doneButton
    }
}

//
//  MomentCoverManager.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/08/02.
//

import UIKit

class MomentCoverManager {
    
    private let userID: String
    
    private let coverURL: URL
    
    init(userID: String) {
        self.userID = userID
        
        let path = NSHomeDirectory().appending("/Documents/\(userID)/MomentCover")
        let url = URL(fileURLWithPath: path)
        try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        
        let coverPath = path.appending("/cover.jpg")
        coverURL = URL(fileURLWithPath: coverPath)
    }
    
    func update(cover: UIImage) {
        NotificationCenter.default.post(name: .momentCoverDidUpdated, object: cover)
        if FileManager.default.fileExists(atPath: coverURL.path) {
            try? FileManager.default.removeItem(at: coverURL)
        }
        if let data = cover.jpegData(compressionQuality: 1.0) {
            try? data.write(to: coverURL)
        }
    }
    
    func cover() -> UIImage? {
        if FileManager.default.fileExists(atPath: coverURL.path) {
            return UIImage(contentsOfFile: coverURL.path)
        }
        return UIImage.as_imageNamed("AlbumListViewBkg_320x320_")
    }
}

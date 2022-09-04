//
//  SVGImage+Extensions.swift
//  WeChatSwift
//
//  Created by Jaykef on 2022/07/02.
//

import SVGKit

extension SVGKImage {
    
    func fill(color: UIColor) {
        if let shapeLayer = caLayerTree.shapeLayer() {
            shapeLayer.fillColor = color.cgColor
        }
    }
}

fileprivate extension CALayer {
    
    func shapeLayer() -> CAShapeLayer? {
        guard let sublayers = sublayers else {
            return nil
        }
        for layer in sublayers {
            if let shape = layer as? CAShapeLayer {
                return shape
            }
            return layer.shapeLayer()
        }
        return nil
    }
}

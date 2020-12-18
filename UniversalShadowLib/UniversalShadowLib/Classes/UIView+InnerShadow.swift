//
//  UIView+InnerShadow.swift
//  UniversalShadowLib
//
//  Created by Tiago Flores on 18/12/2020.
//

import Foundation

public extension UIView {
    
    func applyInnerShadow(
        color: UIColor = .black,
        x: CGFloat = 0,
        y: CGFloat = 0,
        blur: CGFloat = 0.7,
        spread: CGFloat = 20,
        alpha: Float = 0) {
        
        let configurator = InnerShadowConfigurator()
        for edge in  [UIRectEdge.left, UIRectEdge.bottom, UIRectEdge.top, UIRectEdge.right]   {
            let gradientlayer  = CAGradientLayer()
            configurator.applyLayerShadowColorStyle(color: color, alpha: alpha, blur: blur, to: gradientlayer)
          
            gradientlayer.shadowOffset = CGSize.zero
            switch edge {
            case UIRectEdge.top:
                configurator.applyTopLayerConfiguration(y: y, spread: spread, viewBounds: bounds, to: gradientlayer)
            case UIRectEdge.bottom:
                configurator.applyBottomLayerConfiguration(y: y, spread: spread, viewBounds: bounds, to: gradientlayer)
                
            case UIRectEdge.left:
                configurator.applyLeftLayerConfiguration(x: x, spread: spread, viewBounds: bounds, to: gradientlayer)
            case UIRectEdge.right:
                configurator.applyRightLayerConfiguration(x: x, spread: spread, viewBounds: bounds, to: gradientlayer)
            default:
                break
            }
            self.layer.addSublayer(gradientlayer)
        }
        
    }
    
  
}


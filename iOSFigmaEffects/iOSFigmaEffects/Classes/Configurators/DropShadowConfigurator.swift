//
//  DropShadowConfigurator.swift
//  UniversalShadowLib
//
//  Created by Tiago Flores on 18/12/2020.
//

import Foundation

class DropShadowConfigurator {
    
    func applyLayerShadowColorStyle(
        color: UIColor = .black,
        alpha: Float = 0.5,
        blur: CGFloat = 4,
        toLayer layer: CALayer) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        
        /*
         The shadow in iOS is more blurry than the one in Sketch, so we need to tune it down a bit. To do that, we have to divide a value that we get from the Sketch with some value before we can use it as shadowRadius. From what I read and try, the magic number is 2.
         */
        layer.shadowRadius = blur / 2.0
    }
    
    func applyLayerDropShadowPath(
        fromViewBounds viewBounds: CGRect,
        spread: CGFloat = 0,
        toLayer layer: CALayer) {
        layer.masksToBounds = false
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            /*
             In Sketch/Figma, positive value of spread in crease the size of the shadow, but positive parameter in insetBy(dx:dy:) will use as an inset which will reduce the rectangle size. So, we need to invert the sign to make the result rectangle bigger.
             */
            let dx = -spread
            let rect = viewBounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}

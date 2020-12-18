//
//  View+UniversalShadow.swift
//  Nimble
//
//  Created by Tiago Flores on 17/12/2020.
//

import UIKit

import UIKit

enum InnerShadowDirection {
    case Top
    case Right
    case Bottom
    case Left
}

public extension UIView {
    
    // also called Outer Shadow
     func applyDropShadow(
         color: UIColor = .black,
         x: CGFloat = 0,
         y: CGFloat = 2,
         blur: CGFloat = 4,
         spread: CGFloat = 0,
         alpha: Float = 0.5) {
         
         let shadowView = UIView()
        shadowView.backgroundColor = UIColor.white
        let configurator = DropShadowConfigurator()
        configurator.applyLayerShadowColorStyle(color: color, alpha: alpha, blur: blur, toLayer: shadowView.layer)
        configurator.applyLayerDropShadowPath(fromViewBounds: self.bounds, spread: spread, toLayer: shadowView.layer)
   
         shadowView.layer.shadowOffset = CGSize(width: x, height: y)
         superview?.insertSubview(shadowView, belowSubview: self)
         pin(toMe: shadowView)
      }
    
 
    
    private func pin(toMe view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOSApplicationExtension 9.0, *) {
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
        }
    }
}

//
//  UILayer+UniversalShadow.swift
//  UniversalShadowLib
//
//  Created by Tiago Flores on 17/12/2020.
//

import UIKit


extension CALayer {
    
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0, viewBounds: CGRect) {
        
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
       
        if spread == 0 {
            shadowPath = nil
        } else {
          let dx = -spread
            let rect = viewBounds/*shadowView.bounds*/.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}

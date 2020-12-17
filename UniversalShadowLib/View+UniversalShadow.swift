//
//  View+UniversalShadow.swift
//  Nimble
//
//  Created by Tiago Flores on 17/12/2020.
//

import UIKit


public extension UIView {
    
    // also called Outer Shadow
    func applyDropShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0) {
        
        let shadowView = UIView()
     
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = color.cgColor
        shadowView.layer.shadowOpacity = alpha
        shadowView.layer.shadowOffset = CGSize(width: x, height: y)
        shadowView.layer.shadowRadius = blur / 2.0
        shadowView.backgroundColor = .white
        
        if spread == 0 {
            shadowView.layer.shadowPath = nil
        } else {
          let dx = -spread
            let rect = shadowView.bounds.insetBy(dx: dx, dy: dx)
            shadowView.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        superview?.insertSubview(shadowView, belowSubview: self)
        pin(view: shadowView)
        
      }

    private func pin(view: UIView) {
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

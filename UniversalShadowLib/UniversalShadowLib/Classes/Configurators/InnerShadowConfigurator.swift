//
//  InnerShadowConfigurator.swift
//  UniversalShadowLib
//
//  Created by Tiago Flores on 18/12/2020.
//

import Foundation

class InnerShadowConfigurator {
    
    func applyLayerShadowColorStyle(
        color: UIColor = .black,
        alpha: Float = 0.5,
        blur: CGFloat = 4,
        to gradientlayer: CAGradientLayer) {
        let fromColor = color
        let toColor = color.withAlphaComponent(1 - blur)
        gradientlayer.colors = [fromColor.cgColor,toColor.cgColor]
        gradientlayer.shadowColor = UIColor.black.cgColor
        gradientlayer.shadowOpacity = alpha
    }
    
    func applyTopLayerConfiguration(
        y: CGFloat = 0,
        spread: CGFloat = 20,
        viewBounds: CGRect,
        to gradientlayer: CAGradientLayer) {
        gradientlayer.shadowRadius = spread + y
        gradientlayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientlayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: viewBounds.width, height: gradientlayer.shadowRadius)
    }
    
    func applyBottomLayerConfiguration(
        y: CGFloat,
        spread: CGFloat,
        viewBounds: CGRect,
        to gradientlayer: CAGradientLayer) {
        gradientlayer.shadowRadius = spread - y
        gradientlayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientlayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientlayer.frame = CGRect(x: 0.0, y: viewBounds.height - gradientlayer.shadowRadius, width: viewBounds.width, height: gradientlayer.shadowRadius)
    }
    
    func applyLeftLayerConfiguration(
        x: CGFloat,
        spread: CGFloat,
        viewBounds: CGRect,
        to gradientlayer: CAGradientLayer) {
        gradientlayer.shadowRadius = spread + x
        gradientlayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientlayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientlayer.frame = CGRect(x: 0.0, y: 0.0, width: gradientlayer.shadowRadius, height: viewBounds.height)
    }
    
    func applyRightLayerConfiguration(
        x: CGFloat,
        spread: CGFloat,
        viewBounds: CGRect,
        to gradientlayer: CAGradientLayer) {
        gradientlayer.shadowRadius = spread - x
        gradientlayer.startPoint = CGPoint(x: 1.0, y: 0.5)
        gradientlayer.endPoint = CGPoint(x: 0.0, y: 0.5)
        gradientlayer.frame = CGRect(x: viewBounds.width - gradientlayer.shadowRadius, y: 0.0, width: gradientlayer.shadowRadius, height: viewBounds.height)
    }
}

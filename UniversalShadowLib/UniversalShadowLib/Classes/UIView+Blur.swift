//
//  View+Blur.swift
//  UniversalShadowLib
//
//  Created by Tiago Flores on 18/12/2020.
//

import UIKit


public extension UIView {
    
    struct BlurableKey {
        static var blurable = "blurable"
    }

    func applyBlur(blur blurValue: CGFloat) {
        
        // Adjust value to similar blur value as Figma
        let radius = blurValue / 2.3
        guard let superview = superview else { return }

        UIGraphicsBeginImageContextWithOptions(CGSize(width: frame.width, height: frame.height), false, 1)

        layer.render(in: UIGraphicsGetCurrentContext()!)

        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }

        UIGraphicsEndImageContext()

        guard let blur = CIFilter(name: "CIGaussianBlur") else { return }

        blur.setValue(CIImage(image: image), forKey: kCIInputImageKey)
        blur.setValue(radius, forKey: kCIInputRadiusKey)

        let ciContext  = CIContext(options: nil)
        guard let result = blur.value(forKey: kCIOutputImageKey) as? CIImage else { return }
        let boundingRect = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        guard let cgImage = ciContext.createCGImage(result, from: boundingRect) else { return }
        let filteredImage = UIImage(cgImage: cgImage)

        let blurOverlay = UIImageView()
        blurOverlay.frame = boundingRect

        blurOverlay.image = filteredImage
        blurOverlay.contentMode = UIViewContentMode.left

        if let stackView = superview as? UIStackView, let index = stackView.arrangedSubviews.index(of: self) {
            removeFromSuperview()
            stackView.insertArrangedSubview(blurOverlay, at: index)

        } else {
            blurOverlay.frame.origin = frame.origin

            UIView.transition(from: self,
                              to: blurOverlay,
                              duration: 0.2,
                              options: UIViewAnimationOptions.curveEaseIn,
                              completion: nil)
        }

        objc_setAssociatedObject(self,
                                 &BlurableKey.blurable,
                                 blurOverlay,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }

    func unBlur() {
        guard let blurOverlay = objc_getAssociatedObject(self, &BlurableKey.blurable) as? UIImageView else { return }

        if let stackView = blurOverlay.superview as? UIStackView, let index = stackView.arrangedSubviews.index(of: blurOverlay) {
            blurOverlay.removeFromSuperview()
            stackView.insertArrangedSubview(self, at: index)

        } else {
            frame.origin = blurOverlay.frame.origin

            UIView.transition(from: blurOverlay,
                              to: self,
                              duration: 0.2,
                              options: UIViewAnimationOptions.curveEaseIn,
                              completion: nil)
        }

        objc_setAssociatedObject(self,
                                 &BlurableKey.blurable,
                                 nil,
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }

    var isBlurred: Bool {
        return objc_getAssociatedObject(self, &BlurableKey.blurable) is UIImageView
    }
}

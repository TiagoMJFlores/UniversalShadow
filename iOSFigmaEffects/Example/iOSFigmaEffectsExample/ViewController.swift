//
//  ViewController.swift
//  UniversalShadowLib
//  Created by tiagoflores2@outlook.com on 12/17/2020.
//  Copyright (c) 2020 tiagoflores2@outlook.com. All rights reserved.
//

import UIKit
import iOSFigmaEffects


extension UIView {

    class func image(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return nil
        }
        view.layer.render(in: ctx)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

    func image() -> UIImage? {
        return UIView.image(self)()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var coolDogImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        coolDogImageView.applyLayerBlur(blur: 5)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


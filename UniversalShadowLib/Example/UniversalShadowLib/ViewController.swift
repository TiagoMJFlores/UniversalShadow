//
//  ViewController.swift
//  UniversalShadowLib
//  Created by tiagoflores2@outlook.com on 12/17/2020.
//  Copyright (c) 2020 tiagoflores2@outlook.com. All rights reserved.
//

import UIKit
import UniversalShadowLib



class ViewController: UIViewController {

    @IBOutlet weak var coolDogImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //coolDogImageView.applyDropShadow(color: UIColor.red, y:6, blur: 30)
        coolDogImageView.applyInnerShadow(color:  UIColor.red, y: 4, spread: 4, alpha: 0.7)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let shadow = CAGradientLayer()
        shadow.colors = [UIColor.red.withAlphaComponent(0.5)]

        shadow.startPoint = CGPoint(x: 1.0, y: 0.5);
        shadow.endPoint = CGPoint(x: 0.0, y: 0.5);
        shadow.frame = CGRect(x: 0, y: 0, width: coolDogImageView.bounds.size.width, height: 5)
        coolDogImageView.layer.insertSublayer(shadow, at: 0)

    }

}


//
//  ViewController.swift
//  UniversalShadowLib
//  Created by tiagoflores2@outlook.com on 12/17/2020.
//  Copyright (c) 2020 tiagoflores2@outlook.com. All rights reserved.
//

import UIKit
import iOSFigmaEffects



class ViewController: UIViewController {

    @IBOutlet weak var coolDogImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //
        //coolDogImageView.applyInnerShadow(color:  UIColor.red, y: 4, spread: 4, alpha: 0.7)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if #available(iOS 10, *) {
          coolDogImageView.applyDropShadow(color: UIColor.red, y:6, blur: 30)
          coolDogImageView.applyBlur(blur: 10)
        } 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


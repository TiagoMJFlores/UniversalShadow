//
//  ViewController.swift
//  UniversalShadowLib
//
//  Created by tiagoflores2@outlook.com on 12/17/2020.
//  Copyright (c) 2020 tiagoflores2@outlook.com. All rights reserved.
//

import UIKit
import UniversalShadowLib

class ViewController: UIViewController {

    @IBOutlet weak var coolDogImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
    
        coolDogImageView.applyDropShadow(color: UIColor.red, y:6, blur: 30)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


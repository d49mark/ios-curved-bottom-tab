//
//  TabBarCtrl.swift
//  iOS_curve_tab
//
//  Created by Dilip on 27/06/20.
//  Copyright © 2020 Dilip. All rights reserved.
//
import Foundation
import UIKit
class MyTabBarCtrl: UITabBarController, UITabBarControllerDelegate {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

   }



}

//
//  FirstViewController.swift
//  iOS_curve_tab
//
//  Created by Dilip on 27/06/20.
//  Copyright © 2020 Dilip. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate

    }


}


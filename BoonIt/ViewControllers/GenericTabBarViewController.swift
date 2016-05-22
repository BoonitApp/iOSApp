//
//  GenericTabBarViewController.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/21/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit

class GenericTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.translucent = false
        self.tabBar.tintColor       = UIColor.whiteColor()
        self.tabBar.barTintColor    = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.00)
    }
}

extension UITabBar{
    public override func sizeThatFits(size: CGSize) -> CGSize {
        let size = CGSizeMake(self.frame.size.width,70)
        return size
    }
}
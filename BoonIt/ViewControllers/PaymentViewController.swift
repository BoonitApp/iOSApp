//
//  PaymentViewController.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/22/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var txtCSV: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDate: UITextField!
    
    @IBOutlet weak var txtNumber: UITextField!
    @IBOutlet var priceBtns: [UIButton]!
    @IBOutlet weak var priceContainer: UIView!
    @IBOutlet weak var imgAim: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.priceContainer.layer.cornerRadius  = 15
        self.priceContainer.layer.masksToBounds = true
        self.imgAim.layer.masksToBounds         = true
    }
    
    @IBAction func setValue(sender: AnyObject) {
        for btn in priceBtns{
            if (sender as! UIButton).tag == btn.tag {
                btn.backgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.00)
                btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            }else{
                btn.backgroundColor = UIColor.whiteColor()
                btn.setTitleColor(UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.00), forState: .Normal)
            }
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("????")
        self.txtCSV.resignFirstResponder()
        self.txtName.resignFirstResponder()
        self.txtDate.resignFirstResponder()
        self.txtNumber.resignFirstResponder()
    }
    
    @IBAction func pay(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func closePayment(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

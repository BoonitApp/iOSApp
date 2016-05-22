//
//  ViewController.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/21/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func login(sender: AnyObject) {
        let login = FBSDKLoginManager()
        login.logInWithReadPermissions(["public_profile","email"], fromViewController: self) {  (result, error) -> Void in
            if (error != nil){
                print(error)
                print("An error just happened: Facebook login")
            }else{
                if result.isCancelled{
                    print("User just cancelled the login")
                }else{
                    FBSDKGraphRequest(graphPath: "me?fields=picture,email,name,first_name,last_name", parameters: nil).startWithCompletionHandler({ (conn, result, error) -> Void in
                        if error == nil {
                            let tabBarView = self.storyboard?.instantiateViewControllerWithIdentifier("GenericTabBarViewController") as! GenericTabBarViewController
                            
                            self.presentViewController(tabBarView, animated: true, completion: nil)
                        }else{
                            print(error.description)
                        }
                    })
                }
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}


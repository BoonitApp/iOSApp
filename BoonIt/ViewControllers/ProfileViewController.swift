//
//  ProfileViewController.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/21/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class ProfileViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() != nil){
            FBSDKGraphRequest.init(graphPath: "me?fields=id,name,email", parameters: nil).startWithCompletionHandler({ (conn: FBSDKGraphRequestConnection!, result:AnyObject!, error:NSError!) in
                if error != nil{
                    print(error)
                }else{
                    let json = JSON(result)
                    let url  = "https://graph.facebook.com/\(json["id"].stringValue)/picture?type=large"
                    self.imgUser.kf_setImageWithURL(NSURL(string: url)!)
                    self.lblName.text = json["name"].stringValue
                }
            })
        }
    }
    
    @IBAction func logout(sender: AnyObject) {
        let logout = FBSDKLoginManager()
        logout.logOut()
        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        self.presentViewController(loginView, animated: true, completion: nil)
    }
}

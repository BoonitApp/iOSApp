//
//  ProyectsTableViewController.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/21/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ProyectsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.00)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("HighlightedCell", forIndexPath: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0{
            let view = UIView()
            view.backgroundColor = UIColor(red:0.35, green:0.58, blue:0.57, alpha:1.00)
            return view
        }
        return nil
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 100 :  0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.section == 0 ? 400 :  122
    }
}

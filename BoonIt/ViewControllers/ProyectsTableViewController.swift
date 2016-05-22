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


struct Project{
    var desc:String
    var goal:Int
    var name:String
    var imagen:String
}

class ProyectsTableViewController: UITableViewController {
    
    let baseURL = "http://boon.cloudapp.net:3000/projects"
    var projects = [Project]()
    
    func getProjects(){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let request = NSMutableURLRequest(URL: NSURL(string: baseURL)!)
        Alamofire.request(request).responseJSON { response in
            if let j = response.result.value {
                let json = JSON(j)
                for p in json{
                    let pr = Project(desc: p.1["description"].stringValue, goal: p.1["goal"].intValue, name: p.1["name"].stringValue, imagen: p.1["imagen"].stringValue)
                    self.projects.append(pr)
                }
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red:0.24, green:0.24, blue:0.24, alpha:1.00)
        
        self.getProjects()
        
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
        if projects.count > 1{
            return section == 0 ? 1 : (projects.count-1)
        }
        return projects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("HighlightedCell", forIndexPath: indexPath) as! Project1TableViewCell
            cell.setProject(projects[indexPath.row])
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! Project2TableViewCell
        cell.setProject(projects[indexPath.row+1])
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

//
//  Project2TableViewCell.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/22/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit

class Project2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblNeeds: UILabel!
    @IBOutlet weak var progress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProject: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setProject(project:Project){
        lblName.text       = project.name
        imgProject.kf_setImageWithURL(NSURL(string: project.imagen)!)
        print(project.imagen)
        print(project.name)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

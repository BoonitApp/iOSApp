//
//  Project1TableViewCell.swift
//  BoonIt
//
//  Created by Jorge Raul Ovalle Zuleta on 5/22/16.
//  Copyright © 2016 BoonIt. All rights reserved.
//

import UIKit
import Kingfisher

class Project1TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCategory: UIImageView!
    @IBOutlet weak var imgProject: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setProject(project:Project){
        lblTitle.text       = project.name
        lblDescription.text = project.desc
        print(project.imagen)
        imgProject.kf_setImageWithURL(NSURL(string: project.imagen)!)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//
//  HomeCell.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    // MARK: View Properties
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var cellbackground_View:UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellbackground_View.layer.borderWidth = 1.0
        self.cellbackground_View.layer.borderColor = UIColor.lightGray.cgColor
        self.cellbackground_View.layer.cornerRadius = 5.0
    }

}


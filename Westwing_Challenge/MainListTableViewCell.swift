//
//  MainListTableViewCell.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import Kingfisher

class MainListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    @IBOutlet weak var imageSublineLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func customizeCellWithListObject(model: MainListModel) {
        
        self.cellImageView.kf_showIndicatorWhenLoading = true
        let imageURL = NSURL(string: model.navigationURL!)
        self.cellImageView.kf_setImageWithURL(imageURL!)
        self.imageNameLabel.text = model.name
        self.imageSublineLabel.text = model.subline
    }

}

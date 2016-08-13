//
//  DetailViewController.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: BaseViewController {

    var itemModel: MainListModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sublineLabel: UILabel!
    @IBOutlet weak var navigationURLLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = itemModel?.name
        setViewData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setViewData() {
        nameLabel.text = itemModel?.name
        sublineLabel.text = itemModel?.subline
        navigationURLLabel.text = itemModel?.navigationURL
        startDateLabel.text = itemModel?.startTimeFormatted
        descriptionTextView.text = itemModel?.itemDescription
        descriptionTextView.font = UIFont.systemFontOfSize(20.0)
        if let model = itemModel {
            if let url = model.navigationURL{
                let imageURL = NSURL(string: url)
                itemImageView.kf_setImageWithURL(imageURL!)

            }

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

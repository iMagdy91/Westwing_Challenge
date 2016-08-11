//
//  MainListViewController.swift
//  Westwing_Challenge
//
//  Created by Mohamed Magdy on 8/11/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

class MainListViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    var listArray: Array<MainListModel>?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchListData(){
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        MainListStore.getMainListWithSuccess({ (modelArray) in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.listArray = modelArray
            self.tableView.reloadData()
            }) { (error) in
               self.handleError(error)
        }
    }
    
    // Mark: - UITableViewDataSource Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = listArray {
            return list.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = TableViewCellID.mainListCellIdentifier
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MainListTableViewCell
        if cell == nil {
            cell = MainListTableViewCell.init(style: .Default, reuseIdentifier: identifier)
        }
        
        
        return cell!
        
    }
    
    // Mark: - UITableViewDelegate Methods

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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

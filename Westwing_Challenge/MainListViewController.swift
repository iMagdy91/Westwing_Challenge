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
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 360.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listArray?.count ?? 0)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = TableViewCellID.mainListCellIdentifier
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MainListTableViewCell
        if cell == nil {
            cell = MainListTableViewCell.init(style: .Default, reuseIdentifier: identifier)
        }
        
        cell!.customizeCellWithListObject(listArray![indexPath.row])
        
        cell!.selectionStyle = .None
        
        return cell!
        
    }
    
    // Mark: - UITableViewDelegate Methods

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Segue.detailViewControllerSegue, sender: indexPath)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == Segue.detailViewControllerSegue {
            let indexPath = sender as! NSIndexPath
            let detailViewController = segue.destinationViewController as! DetailViewController
            detailViewController.itemModel = listArray![indexPath.row]
        }
    }
    

}

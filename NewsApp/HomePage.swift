//
//  HomePage.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import UIKit

class HomePage: UITableViewController {
    
    // MARK: ViewLife Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: TableView Cell RowCount
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeTblViewCellData.count
    }

    // MARK: Configure TableView cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as? HomeCell else{
            return UITableViewCell()
        }
        // This outer section will be call when cell configure properly
        cell.feedTitle.text = HomeTblViewCellData[indexPath.row]
        return cell
     }
    
    // MARK: TableView Cell Selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Initiliaze storyboard reference and pass url for the particular news section then push to the next viewcontroller
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "FeedPage") as! FeedPage
        // Pass navigation title to next viewcontroller
            nextViewController.navTitle = HomeTblViewCellData[indexPath.row]
            switch indexPath.row{
            case 0:
                // For US news headlines
                nextViewController.selectedURl = .topHeadline
            case 1:
                // For Bitcoins updata
                nextViewController.selectedURl = .everything
            case 2:
                // For techcrunch headlines
                nextViewController.selectedURl = .topHeadlineTechCrunch
            case 3:
                // For apple
                nextViewController.selectedURl = .apple
            case 4:
                // For wall street journal
                nextViewController.selectedURl = .wallStreet
            default:
                break
            }
        
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    // MARK: TableView Cell Height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 4.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height:4))
        headerView.backgroundColor = UIColor.lightGray
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height:4))
        headerView.backgroundColor = UIColor.lightGray
        return headerView
    }


}

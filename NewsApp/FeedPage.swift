//
//  FeedPage.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import UIKit

class FeedPage: UITableViewController {

    // MARK: Class Properties
    var selectedURl:URLString = .topHeadline
    var feedData=[Articles]()
    var navTitle = ""
    
    // MARK: View Property
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    // MARK: ViewLife Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: ViewLife Cycle Method
    override func viewWillAppear(_ animated: Bool) {
        self.fetchData(url: selectedURl.rawValue)
        self.navigationItem.title = navTitle
    }
    
    // MARK: Fetch the data from the api
    func fetchData(url:String){
        self.indicator.startAnimating()
        let urlString=baseUrl+url+apiToken
        var request=URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task=URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil, let usableData=data else{
                return
            }
            do{
                let report=try JSONDecoder().decode(ModelData.self, from: usableData)
                self.feedData=report.articles!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.indicator.stopAnimating()
                }
                
            }catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
 
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     // MARK: Set count for table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }

    // MARK: Configure cell and set news headlines
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedCell else{
            return UITableViewCell()
        }
        // MARK:  This outer section will be call when cell configure properly
        cell.feed=Feed(title: self.feedData[indexPath.row].title, feedDescription: feedData[indexPath.row].description, feedPublish: self.feedData[indexPath.row].publishedAt,urlToImage:self.feedData[indexPath.row].urlToImage)
        
        // MARK: calling closoure for readmore section and open webview controller
        cell.readMoreAction={(cell) in
            if let urlPath=self.feedData[indexPath.row].url{
                
            // MARK: Initiliaze storyboard reference and pass url for the particular full news section then push to the next viewcontroller
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let webViewController = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
                webViewController.urlString=urlPath
                self.navigationController?.pushViewController(webViewController, animated: true)
            }
            
        }
        
        return cell
    }
    
    // MARK: Set Height for table cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    

}

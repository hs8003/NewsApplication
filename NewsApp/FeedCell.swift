//
//  FeedCell.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import UIKit

// MARK: property for cache imgage
var cache = NSCache<AnyObject, AnyObject>()

class FeedCell: UITableViewCell {
    
    // MARK: View Properties
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var feedDescription: UILabel!
    @IBOutlet weak var feedPublish: UILabel!
    
    //Set the fetching value on the label
    fileprivate func fetchImage() {
        // downloading images data
        // To check the image is not nil
        if (feed.urlToImage != nil) && (feed.urlToImage != ""){
            DispatchQueue.global().async {
                if let fedImg = self.feed.urlToImage{
                    if let data = NSData(contentsOf:URL(string:fedImg)!){
                        DispatchQueue.main.async {
                            self.feedImage.image = UIImage(data: data as Data)
                            // saving downlodaing images into cache memory
                            cache.setObject(UIImage(data: data as Data)!, forKey: self.feed.urlToImage as AnyObject)
                        }
                    }
                }
            }
        }
    }
    
    var feed:Feed!{
        didSet{
            feedTitle.text=feed.title
            if (feed.feedDescription != nil) && (feed.feedDescription != ""){
                feedDescription.text=feed.feedDescription
            }
            else{// Set the default description when description is not available
                feedDescription.text=DefaultDescription
            }
            feedPublish.text=feed.feedPublish
            if let img = cache.object(forKey:feed.urlToImage as AnyObject ){
                self.feedImage.image = img as? UIImage
            }else{
                fetchImage()
                //Placeholder Image when image is not comming from server
                self.feedImage.image = UIImage(named: "placeholder_image")
            }
        }
    }
    
    // Variable for custom closure that will be pass in below action.
    var readMoreAction:((FeedCell)->Void)?
    
    // When will press read more button
    @IBAction func onClickReadMore(_ sender: UIButton) {
        if let action=self.readMoreAction{
            action(self)
        }
    }
}


// MARK: Class properties and initalize them
class Feed{
    var title:String?
    var feedDescription:String?
    var feedPublish:String?
    var urlToImage:String?
    init(title:String?,feedDescription:String?,feedPublish:String?,urlToImage:String?) {
        self.title=title
        self.feedDescription=feedDescription
        self.feedPublish=feedPublish
        self.urlToImage=urlToImage
    }
}




















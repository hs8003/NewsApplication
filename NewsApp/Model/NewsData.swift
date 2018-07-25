//
//  NewsData.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import Foundation

// MARK: Create global properties then can use everywhere
var apiKey = "0ee73058c40f402182a34cf1124218ea"
var baseUrl = "https://newsapi.org/v2/"
let apiToken="apiKey=0ee73058c40f402182a34cf1124218ea"

// Data Array That will be show in tableView Cell
var HomeTblViewCellData = ["US Bussiness Headlines","Bitcoins","TechCrunch Headlines","Apple","Wall Street Journal"]

// MARK: Setup case for particular section
enum URLString:String{
    case topHeadline="top-headlines?country=us&category=business&"
    case everything = "everything?q=bitcoin&sortBy=publishedAt&"
    case topHeadlineTechCrunch = "top-headlines?sources=techcrunch&"
    case apple = "everything?q=apple&from=2018-07-23&to=2018-07-23&sortBy=popularity&"
    case wallStreet = "everything?domains=wsj.com&"
}


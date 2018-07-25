
//
//  ModelData.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//


import Foundation

struct ModelData : Codable {
	let status : String?
	let totalResults : Int?
	let articles : [Articles]?

	enum CodingKeys: String, CodingKey {
		case status = "status"
		case totalResults = "totalResults"
		case articles = "articles"
	}
    
    // MARK: Inialitize and assign to the specific case value
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
		articles = try values.decodeIfPresent([Articles].self, forKey: .articles)
	}

}


//
//  Articles.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//

import Foundation
// MARK: Make struct type of codable
struct Articles : Codable {
	let source : Source?
	let author : String?
	let title : String?
	let description : String?
	let url : String?
	let urlToImage : String?
	let publishedAt : String?

	enum CodingKeys: String, CodingKey {

		case source = "source"
		case author = "author"
		case title = "title"
		case description = "description"
		case url = "url"
		case urlToImage = "urlToImage"
		case publishedAt = "publishedAt"
	}

    // MARK: Inialitize and assign to the specific case value
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		source = try values.decodeIfPresent(Source.self, forKey: .source)
		author = try values.decodeIfPresent(String.self, forKey: .author)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
		publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
	}

}


//
//  Source.swift
//  NewsApp
//
//  Created by Harshit Sharma on 24/07/18.
//  Copyright © 2018 NIC. All rights reserved.
//


import Foundation
// MARK: Make struct type of codable
struct Source : Codable {
	let id : String?
	let name : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case name = "name"
	}

    // MARK: Inialitize and assign to the specific case value
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}

}

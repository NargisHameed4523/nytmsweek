//
//  MediaMetadata.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//

import Foundation
struct MediaMetadata : Codable {
	let url    : String?
	let format : String?
	let height : Int?
	let width  : Int?

	enum CodingKeys: String, CodingKey {

		case url    = "url"
		case format = "format"
		case height = "height"
		case width  = "width"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url        = try values.decodeIfPresent(String.self, forKey: .url)
		format     = try values.decodeIfPresent(String.self, forKey: .format)
		height     = try values.decodeIfPresent(Int.self, forKey: .height)
		width      = try values.decodeIfPresent(Int.self, forKey: .width)
	}

}

//
//  Beer.swift
//  Beer-Recipes
//
//  Created by Igor Belobrov on 18.09.2023.
//

import Foundation

struct Beer: Codable {
    
    var name: String?
    var description: String?
    var image_url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case image_url = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
    }
}

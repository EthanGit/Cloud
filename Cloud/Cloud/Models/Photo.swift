//
//  Photo.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.albumID = try container.decode(Int.self, forKey: .albumID)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.thumbnailURL = try container.decodeIfPresent(String.self, forKey: .thumbnailURL)
    }
}

typealias Photos = [Photo]

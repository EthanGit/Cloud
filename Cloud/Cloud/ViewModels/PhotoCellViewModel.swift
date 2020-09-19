//
//  PhotoCellViewModel.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation

class PhotoCellViewModel {
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    var id: String {
        return String(photo.id)
    }
    
    var title: String {
        return photo.title
    }
    
    var coverImageUrl: URL {
        return URL(string: photo.thumbnailURL!)!
    }
    
}

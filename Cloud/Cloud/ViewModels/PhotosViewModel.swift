//
//  PhotosViewModel.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation

class PhotosViewModel {
    
    public var photos: [Photo] = []
    
    func getPhotos(_ completionHandler: @escaping() -> ()) {
        ApiManager.shared.getPhotos { photos in
            self.photos = photos
            completionHandler()
        }
    }
    
    var numberOfPhotos: Int {
        return photos.count
    }
    
    func viewModelForPhoto(at index: Int) -> PhotoCellViewModel? {
        guard index < photos.endIndex else {
            return nil
        }
        return PhotoCellViewModel(photo: photos[index])
    }
}

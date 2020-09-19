//
//  PhotoCellViewModel.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import Foundation
import UIKit

class PhotoCellViewModel {
    var id: String
    var title: String
    var imageUrlStr: String
    
    private let downloadImageQueue = OperationQueue()
    var onImageDownloaded: ((UIImage?) -> Void)?
    let imageCache = NSCache<NSURL, UIImage>()

    init(id: String, title: String, imageUrl: String?) {
        self.id = id
        self.title = title
        self.imageUrlStr = imageUrl ?? ""
    }

    func getImage() {
        guard let url = URL(string: imageUrlStr) else { return }
        downloadImageQueue.addOperation { [weak self] in
            ApiManager.shared.fetchImage(url: url) { (image) in
            guard let imageDownloaded = self?.onImageDownloaded else { return }
                imageDownloaded(image)
            }
        }
    }
}

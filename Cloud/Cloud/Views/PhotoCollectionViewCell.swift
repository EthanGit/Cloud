//
//  PhotoCollectionViewCell.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(_ viewModel: PhotoCellViewModel?) {
        imageView.image = nil
        guard let photoViewModel = viewModel else { return }
        idLabel.text = photoViewModel.id
        titleLabel.text = photoViewModel.title
        
        ApiManager.shared.fetchImage(url: photoViewModel.coverImageUrl) { [weak self] (image) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
    }
    
    
}

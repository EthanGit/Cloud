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
    
    private var viewModel: PhotoCellViewModel?

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        self.viewModel?.onImageDownloaded = nil
    }
    
    func configure(_ viewModel: PhotoCellViewModel?) {
        self.viewModel = viewModel
        
        idLabel.text = viewModel?.id
        titleLabel.text = viewModel?.title
      
        self.viewModel?.onImageDownloaded = { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }
        self.viewModel?.getImage()
    }
    
    
}

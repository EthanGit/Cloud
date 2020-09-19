//
//  PhotosViewController.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!

    let viewModel = PhotosViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.getPhotos {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionLayout.minimumInteritemSpacing = 1
        collectionLayout.minimumLineSpacing = 2
        
        let width = UIScreen.main.bounds.size.width / 4 - 2.0
        collectionLayout.itemSize = CGSize(width: width, height: width)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell else { return PhotoCollectionViewCell() }
        let photo = viewModel.viewModelForPhoto(at: indexPath.row)
        cell.configure(photo)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select")
    }
}

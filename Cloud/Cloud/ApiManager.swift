//
//  ApiManager.swift
//  Cloud
//
//  Created by Ethan on 2020/9/19.
//  Copyright © 2020 Ethan. All rights reserved.
//

import UIKit
import Combine

final class ApiManager {

    static let shared: ApiManager = ApiManager()
    let imageCache = NSCache<NSURL, UIImage>()

    private let baseUrl: String = "https://jsonplaceholder.typicode.com"
    
    var cancellableSet: Set<AnyCancellable> = []
    
    func getPhotos(_ completionHandler: @escaping([Photo]) -> ()) {
        URLSession.shared.dataTaskPublisher(for: URL(string: self.baseUrl + "/photos")!)
            .map(\.data)
            .decode(type: Photos.self, decoder: JSONDecoder())
            .sink { error in
                print(error)
            } receiveValue: { res in
                completionHandler(res)
            }
            .store(in: &cancellableSet)
    }

//    func getPhotos(_ completionHandler: @escaping([Photo]) -> ()) {
//        URLSession.shared.dataTask(with: URL(string: self.baseUrl + "/photos")!) { data, response, error in
//            if let data = data {
//                do {
//                    let res = try JSONDecoder().decode(Photos.self, from: data)
//                    print(res)
//                    completionHandler(res)
//                } catch let error {
//                    print(error)
//                }
//            }
//        }.resume()
//    }
    
    func fetchImage(url: URL, completionHandler: @escaping (UIImage?) -> ()) {
        if let image = imageCache.object(forKey: url as NSURL) {
            completionHandler(image)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url as NSURL)
                completionHandler(image)
            } else {
                completionHandler(nil)
            }
        }.resume()
    }
}


//
//  ImageLoader.swift
//  DuckDuckGo
//
//  Created by Ilgar Ilyasov on 6/8/19.
//  Copyright © 2019 IIIyasov. All rights reserved.
//

import Foundation
import UIKit

class ImagerLoader {
    
    func loadImage(for topic: RelatedTopic,
                   completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let iconURLString = topic.icon?.URL,
            !iconURLString.isEmpty else {
            completion(.success(UIImage(named: "placeholder")!))
            return
        }
        
        guard let url = URL(string: iconURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse {
                NSLog("URL response: \(response.statusCode)")
            }
            
            guard let data = data else {
                let error = NSError(domain: "com.IIlyasov.DuckDuckGo.ErrorDomain", code: -1, userInfo: nil)
                completion(.failure(error))
                return
            }
            
            let image = UIImage(data: data)!
            completion(.success(image))
        }.resume()
    }
}

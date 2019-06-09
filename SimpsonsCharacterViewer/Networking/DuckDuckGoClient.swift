//
//  DuckDuckGoClient.swift
//  DuckDuckGo
//
//  Created by Ilgar Ilyasov on 6/8/19.
//  Copyright © 2019 IIIyasov. All rights reserved.
//

import Foundation

class DuckDuckGoClient {
    
    // http://api.duckduckgo.com/?q=simpsons+characters&format=json
    private let baseURL = URL(string: "https://api.duckduckgo.com/")!
    
    private func getURL(for searchTerm: String) -> URL {
        let formattedString = searchTerm.replacingOccurrences(of: " ", with: "+")
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        let searchQuery = URLQueryItem(name: "q", value: formattedString)
        let formatQuery = URLQueryItem(name: "format", value: "json")
        
        urlComponents.queryItems = [searchQuery, formatQuery]
        return urlComponents.url!
    }
    
    func performSearch(for searchTerm: String,
                   completion: @escaping (Result<[RelatedTopic], Error>) -> Void) {
        
        let url = getURL(for: searchTerm)
        
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
            
            do {
                
                let decodedObject = try JSONDecoder().decode(DuckDuckGo.self, from: data)
                let relatedTopics = decodedObject.relatedTopics
                completion(.success(relatedTopics ?? []))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
}

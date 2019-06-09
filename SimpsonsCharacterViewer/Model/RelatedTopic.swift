//
//  RelatedTopic.swift
//  DuckDuckGo
//
//  Created by Ilgar Ilyasov on 6/8/19.
//  Copyright © 2019 IIIyasov. All rights reserved.
//

import Foundation

struct RelatedTopic: Decodable {
    let result: String?
    let text: String?
    let icon: Icon?
    let firstURL: String?
    
    enum CodingKeys: String, CodingKey {
        case result = "Result"
        case text = "Text"
        case icon = "Icon"
        case firstURL = "FirstURL"
    }
}

struct Icon: Decodable {
    let URL: String?
    
    enum CodingKeys: String, CodingKey {
        case URL = "URL"
    }
}

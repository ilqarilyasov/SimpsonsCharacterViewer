//
//  DuckDuckGo.swift
//  DuckDuckGo
//
//  Created by Ilgar Ilyasov on 6/8/19.
//  Copyright © 2019 IIIyasov. All rights reserved.
//

import Foundation

struct DuckDuckGo: Decodable {
    let relatedTopics: [RelatedTopic]?
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

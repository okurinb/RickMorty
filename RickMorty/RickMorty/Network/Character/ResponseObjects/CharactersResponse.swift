//
//  CharactersResponse.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import UIKit
import ObjectMapper

class CharactersResponse: Mappable {
    var results: [CharacterRO]?
    var name: String?
    var imageUrl: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        results <- map["results"]
    }
}

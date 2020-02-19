//
//  CharacterRO.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import UIKit
import ObjectMapper

class CharacterRO: Mappable {
    var characterId: Int?
     var name: String?
     var imageUrl: String?
     
     required init?(map: Map) { }
     
     func mapping(map: Map) {
         characterId <- map["id"]
         name <- map["name"]
         imageUrl <- map["image"]
     }
}

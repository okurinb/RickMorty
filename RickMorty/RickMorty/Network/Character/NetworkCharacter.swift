//
//  NetworkCharacter.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import Foundation
import Moya

enum NetworkCharacter {
    case characters(page: Int)
}

extension NetworkCharacter: TargetType {
    
    var baseURL: URL {
        return URL(string: AppURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .characters:
            return "character"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .characters(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["content-type": "application/json"]
    }
}

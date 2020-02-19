//
//  Network.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct AppURL {
    static let baseURL = "https://rickandmortyapi.com/api/"
}

struct Network {
    let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin()])
    func request<T: TargetType, R: Mappable>(target: T, responseObjectType: R.Type, success successCallback: @escaping (R) -> Void, error errorCallback: @escaping (Swift.Error) -> Void) {

        provider.request(MultiTarget(target)) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300,
                    let responseString = String(data: response.data, encoding: String.Encoding.utf8) as String? {
                    if let responseObject = responseObjectType.init(JSONString: responseString) {
                        successCallback(responseObject)
                    } else {
                        let error = NSError(domain: AppURL.baseURL, code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                        errorCallback(error)
                    }
                } else {
                    let error = NSError(domain: AppURL.baseURL, code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                errorCallback(error)
            }
        }
    }
}

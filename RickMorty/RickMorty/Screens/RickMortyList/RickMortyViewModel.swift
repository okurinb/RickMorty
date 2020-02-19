//
//  RickMortyViewModel.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import UIKit

class RickMortyViewModel {
    private let network = Network()
    private var characters: [CharacterRO] = []
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return characters.count
    }
    
    func objectAt(index: IndexPath) -> Any? {
        if index.row < characters.count {
            return characters[index.row]
        } else {
            return nil
        }
    }
    
    func loadCharactersFrom(page: Int, completion: @escaping (_ success: Bool) -> ()) {
        network.request(target: NetworkCharacter.characters(page: page),
                        responseObjectType: CharactersResponse.self,
                        success: { [weak self] (response) in
                            guard let `self` = self else { return }
                            self.characters = response.results ?? []
                            completion(true)
        }) { (error) in
            completion(false)
        }
    }
}

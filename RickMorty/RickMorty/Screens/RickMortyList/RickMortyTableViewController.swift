//
//  RickMortyTableViewController.swift
//  RickMorty
//
//  Created by Борис Окурин on 20.11.2019.
//  Copyright © 2019 Борис Окурин. All rights reserved.
//

import UIKit
import SDWebImage

class RickMortyTableViewController: UITableViewController {
    let viewModel = RickMortyViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    func loadData() {
        self.viewModel.loadCharactersFrom(page: 1) { (success) in
            if success {
                self.tableView.reloadData()
            } else {
                // TODO: request again
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.numberOfRowsIn(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        let character = self.viewModel.objectAt(index: indexPath) as? CharacterRO
        cell.characterNameLabel.text = character?.name
        cell.characterImageView.sd_setImage(with: URL(string: character?.imageUrl ?? ""), completed: nil)
        return cell
    }
}

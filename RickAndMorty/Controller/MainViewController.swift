//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by Erik Flores on 27/01/21.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    @IBOutlet weak var mainTableView: CharactersTableView!
    
    override func loadView() {
        super.loadView()
        mainTableView.dataSource = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath)
        guard let cell = dequeueCell as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}


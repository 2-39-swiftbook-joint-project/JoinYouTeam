//
//  DeveloperListViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

class DeveloperListViewController: UITableViewController {
    
    private let developers = StorageManager.shared.getDevelopers()
    var user: Developer!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let developerVC = segue.destination as? DeveloperViewController
        developerVC?.developer = developers[indexPath.row]
    }
}

//MARK: - UITableViewDataSource
extension DeveloperListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developerCell", for: indexPath)
        let developer = developers[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = developer.name
        content.textProperties.font = UIFont.systemFont(ofSize: 20)
        content.secondaryText = "@" + developer.github
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12)
        cell.contentConfiguration = content
        return cell
    }
}


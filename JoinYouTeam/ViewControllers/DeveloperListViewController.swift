//
//  DeveloperListViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

final class DeveloperListViewController: UITableViewController {
    
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
        developerVC?.user = user
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
        let name = developer.name
        let github = developer.github
        let maxLenght = 25
        var content = cell.defaultContentConfiguration()
        content.text = name.count > maxLenght
            ? String(name[...name.index(name.startIndex, offsetBy: maxLenght)])
            : name
        content.textProperties.font = UIFont.systemFont(ofSize: 20)
        content.secondaryText = github.count > maxLenght
            ? String(github[...github.index(github.startIndex, offsetBy: maxLenght)])
            : github
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12)
        cell.contentConfiguration = content
        return cell
    }
}


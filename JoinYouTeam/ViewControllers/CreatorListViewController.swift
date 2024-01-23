//
//  CreatorListViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

class CreatorListViewController: UITableViewController {
    
    private let creators = StorageManager.shared.getCreators()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
}


//MARK: - UITableViewDataSource
extension CreatorListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        creators.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "creatorCell", for: indexPath)
        let creator = creators[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = creator.name
        content.textProperties.font = UIFont.systemFont(ofSize: 22)
        content.secondaryText = creator.githubAccount
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 14)
        cell.contentConfiguration = content
        return cell
    }
}

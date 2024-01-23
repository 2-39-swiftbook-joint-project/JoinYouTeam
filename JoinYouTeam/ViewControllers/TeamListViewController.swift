//
//  TeamSelectionTableViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamListViewController: UITableViewController {
    
    private var teams: [Team] = []
    var user: Developer!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }
    
    override func viewWillAppear(_ animated: Bool) {
        teams = StorageManager.shared.getTeams()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let teamVC = segue.destination as? TeamViewController
        teamVC?.team = teams[indexPath.row]
        teamVC?.user = user
    }
}

//MARK: - UITableViewDataSource
extension TeamListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
        let team = teams[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = team.name
        content.textProperties.font = UIFont.systemFont(ofSize: 20)
        content.secondaryText = team.projectName
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12)
        cell.contentConfiguration = content
        return cell
    }
}


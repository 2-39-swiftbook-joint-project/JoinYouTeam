//
//  TeamSelectionTableViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamListViewController: UITableViewController {
    
    private var teamList = StorageManager.shared.getTeams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let detailsVC = segue.destination as? TeamDetailsViewController
        detailsVC?.team = teamList[indexPath.section]
    }
}

// MARK: - UITableViewDataSource
extension TeamListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        teamList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
        let team = teamList[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.text = team.name
        content.secondaryText = team.maximumNumberOfDevelopers != nil ? "Количество участников: \(team.developers.count)/\(team.maximumNumberOfDevelopers ?? 1)" : "Количество участников не ограничено"
        
        cell.contentConfiguration = content
        return cell
    }
}

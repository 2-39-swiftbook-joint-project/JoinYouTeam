//
//  TeamViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamViewController: UIViewController {

    @IBOutlet var projectLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var membersNumberLabel: UILabel!
    
    var team: Team!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectLabel.text = team.projectName
        descriptionLabel.text = team.projectDescription
        membersNumberLabel.text = team.maximumNumberOfDevelopers != nil ? "(\(team.developers.count) / \(team.maximumNumberOfDevelopers!)" : "-"
    }
    
    @IBAction func joinTeamButtonTapped(_ sender: Any) {
    }
}

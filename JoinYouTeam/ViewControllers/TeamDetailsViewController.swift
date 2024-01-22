//
//  TeamViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamDetailsViewController: UIViewController {
    
    @IBOutlet var teamLabel: UILabel!
    @IBOutlet var projectLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var membersLabel: UILabel!
    
    var team: Team! = Team(name: "test", projectName: "TEST")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamLabel.text = "Название команды: \(team.name)"
        projectLabel.text = "Название проекта: \(team.projectName)"
        descriptionLabel.text = "Тема проекта: \(team.projectDescription)"
        membersLabel.text = "Количество участников: \(team.developers.count)"

    }
}

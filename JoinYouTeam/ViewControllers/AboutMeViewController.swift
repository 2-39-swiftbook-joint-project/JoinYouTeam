//
//  MyTeamViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class AboutMeViewController: UIViewController {
    
    var team: Team!
    var developer: Developer!
    
    @IBOutlet var aboutMeLabel: UILabel!
    @IBOutlet var aboutTeamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.title = "Обо мне"
        tabBarItem.image = UIImage(systemName: "person.circle.fill")
        aboutMeLabel.text = "Обо мне: \(developer.name) aka \(developer.github)"
        aboutTeamLabel.text = "Моя команда \(team.name)"
    }
}

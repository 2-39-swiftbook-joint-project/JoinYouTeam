//
//  DeveloperViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

final class DeveloperViewController: UIViewController {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var githubLabel: UILabel!
    @IBOutlet private var teamLabel: UILabel!
    
    var developer: Developer!
    var user: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = developer.name
        updateInformation()
    }
    
    @IBAction private func inviteButtonAction() {
        if user.team == nil {
            showAlert(title: "Упс", message: "Сначала найдите команду для себя")
        } else if developer.team != nil {
            showAlert(title: "Упс", message: "\(developer.name) уже состоит в команде")
        } else if user.team?.maximumNumberOfDevelopers ?? Int.max <= user.team?.developers.count ?? 0 {
            showAlert(title: "Упс", message: "В вашей команде уже нет мест")
        } else {
            showAlert(title: "Ура", message: "\(developer.name) присоеденился к Вашей команде!")
            developer.team = user.team
            user.team?.developers.append(developer)
            updateInformation()
        }
        
    }
    
    private func updateInformation() {
        nameLabel.text = developer.name
        githubLabel.text = "@" + developer.github
        teamLabel.text = developer.team?.name ?? "Не выбрана"
    }
}


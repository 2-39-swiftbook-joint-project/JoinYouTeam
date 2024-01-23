//
//  TeamViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamViewController: UIViewController {
    
    @IBOutlet private var projectNameLabel: UILabel!
    @IBOutlet private var projectDescriptionLabel: UILabel!
    @IBOutlet private var maximumNumberOfDevelopersLabel: UILabel!
    @IBOutlet private var developersLabel: UILabel!
    @IBOutlet private var joinButton: UIButton!
    
    var user: Developer!
    var team: Team!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = team.name
        updateInformation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let changeVC = segue.destination as? TeamChangeViewController
        changeVC?.team = team
    }
    
    @IBAction func unwind(for segua: UIStoryboardSegue) {
        let changeVC = segua.source as? TeamChangeViewController
        team.projectDescription = changeVC?.themeTF.text == ""
            ? "Не назначено"
            : changeVC?.themeTF.text
        updateInformation()
    }
    
    @IBAction private func joinButtonAction() {
        if joinButton.titleLabel?.text == "Изменить" {
            performSegue(withIdentifier: "commandSettings", sender: nil)
        } else {
            if user.team == nil {
                if team.developers.count >= team.maximumNumberOfDevelopers ?? Int.max {
                    showAlert(
                        title: "Неудачно",
                        message: "В этой команде уже максимальное количество участников"
                    )
                    return
                }
                user.team = team
                team.developers.append(user)
                showAlert(
                    title: "Ура!",
                    message: "Теперь Вы состоите в команде \(team.name)"
                )
                updateInformation()
            } else {
                showAlert(
                    title: "Неудачно",
                    message: "Вы уже стостоите в команде \(user.team?.name ?? "")"
                )
            }
        }
    }
    
    private func updateInformation() {
        projectNameLabel.text = team.projectName
        projectDescriptionLabel.text = team.projectDescription == nil
            ? "Не назначен"
            : team.projectDescription
        maximumNumberOfDevelopersLabel.text = team.maximumNumberOfDevelopers == nil
            ? "Не назначено"
            : team.maximumNumberOfDevelopers?.formatted()
        
        let developers = team.developers.count == 0
            ? ["Не назначены"]
            : team.developers.map { developer in
                "\(developer.name) - @\(developer.github)"
            }
        developersLabel.text = developers.reduce("", { $0 + "\($1)\n" })
        if team.developers.map({ developer in developer.github }).contains(user.github) {
            joinButton.setTitle("Изменить", for: .normal)
        }
    }
}


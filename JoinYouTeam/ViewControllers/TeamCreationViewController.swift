//
//  TeamCreationViewController.swift
//  JoinYouTeam
//
//  Created by Ксения Загарьева on 22.01.2024.
//

import UIKit

final class TeamCreationViewController: UIViewController {
    
    
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var projectTF: UITextField!
    @IBOutlet private var descriptionTF: UITextField!
    @IBOutlet private var maxCountTF: UITextField!
    
    var user: Developer!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Создать команду"
    }
    
    @IBAction private func createButtonAction() {
        if nameTF.text == nil || projectTF.text == nil {
            showAlert(title: "Упс", message: "Вы должны заполнить все обязательные поля отмеченные *")
        } else {
            let name = nameTF.text ?? "invalid data"
            let project = projectTF.text ?? "invalid data"
            
            let team = Team(
                name: name,
                projectName: project,
                projectDescription: descriptionTF.text,
                maximumNumberOfDevelopers: Int(maxCountTF.text ?? "")
            )
            StorageManager.shared.addTeam(team: team)
            user.team = team
            team.developers.append(user)
            
            dismiss(animated: true)
        }
    }
}

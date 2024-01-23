//
//  UserViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

final class UserViewController: UIViewController {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var githubLabel: UILabel!
    @IBOutlet private var teamLabel: UILabel!

    var user: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.name
        nameLabel.text = user.name
        githubLabel.text = user.github
    }
    
    override func viewWillAppear(_ animated: Bool) {
        teamLabel.text = user.team?.name ?? "В поиске"
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let team = user.team?.name {
            showAlert(title: "Упс", message: "Вы уже состоите в команде \(team)")
            return false
        } else {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let createVC = segue.destination as? TeamCreationViewController
        createVC?.user = user
    }
    
    @IBAction func shuffleButtonAction() {
        let developers = StorageManager.shared.getDevelopers().filter { developer in
            developer.team == nil
        }.shuffled()
                
        for developer in developers {
            let teams = StorageManager.shared.getTeams().shuffled()
            for team in teams {
                let maxCount = team.maximumNumberOfDevelopers ?? Int.max
                if maxCount > team.developers.count {
                    team.developers.append(developer)
                    developer.team = team
                    break
                }
            }
        }
        teamLabel.text = user.team?.name ?? "В поиске"
        showAlert(title: "Юху!", message: "Все разработчики распределены!")
    }
    
}

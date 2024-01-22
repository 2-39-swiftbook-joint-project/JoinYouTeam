//
//  TestViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 22.01.24.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet var userLabel: UILabel!
    
    let developers = StorageManager.shared.getDevelopers()
    let teams = StorageManager.shared.getTeams()
    
    var user: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = "\(user.name) \(user.github) \(user.team?.name ?? "")"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loggerButton(_ sender: Any) {
        let developers = StorageManager.shared.getDevelopers()
        let teams = StorageManager.shared.getTeams()
        print("\n\n----DATA LOG-----")
        for developer in developers {
            print(developer.name, developer.github, developer.team?.name)
        }
        for team in teams {
            print(team.name, team.developers)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TeamChangeViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

final class TeamChangeViewController: UIViewController {
    
    @IBOutlet var themeTF: UITextField!
    
    var team: Team!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = team.name
    }
    
    @IBAction private func doneButtonAction() {
        dismiss(animated: true)
    }

}

//
//  DeveloperViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.01.24.
//

import UIKit

class DeveloperViewController: UIViewController {
    
    var developer: Developer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = developer.name
    }
    
}


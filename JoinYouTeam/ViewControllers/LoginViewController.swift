//
//  ViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.12.23.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var githubTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    var name: String = ""
    private var github: String = ""
    
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        githubTF.delegate = self
    
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTF {
            name = nameTF.text ?? ""
        } else {
            github = githubTF.text ?? ""
        }
        if !name.isEmpty && !github.isEmpty {
            if let developer = storageManager.getDeveloperWith(github: github) {
                if developer.name == name {
                    
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

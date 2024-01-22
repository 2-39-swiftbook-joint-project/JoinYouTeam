//
//  ViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.12.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets and Properties
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var githubTF: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    // MARK: - Private Properties
    private let storageManager = StorageManager.shared
    private var user: Developer?
    private var name: String = ""
    private var github: String = ""
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        githubTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = nil
        loginButton.setTitle("Зарегистрироваться", for: .normal)
        nameTF.text = ""
        githubTF.text = ""
        name = ""
        github = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if user != nil {
            return true
        } else {
            showAlert(title: "Хм", message: "Нужно заполнить оба поля")
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let testVC = segue.destination as? TestViewController {
            if let user {
                storageManager.addDeveloper(developer: user)
                testVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - Private Methods
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
                    user = developer
                    loginButton.setTitle("Войти", for: .normal)
                } else {
                    showAlert(title: "Упс", message: "Пользователь с таким аккаунтом уже существует")
                }
            } else {
                loginButton.setTitle("Зарегистрироваться", for: .normal)
                user = Developer(name: name, github: github)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

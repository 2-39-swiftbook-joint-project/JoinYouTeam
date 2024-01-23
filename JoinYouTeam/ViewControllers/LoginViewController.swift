//
//  ViewController.swift
//  JoinYouTeam
//
//  Created by nikita on 23.12.23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets and Properties
    @IBOutlet private var nameTF: UITextField!
    @IBOutlet private var githubTF: UITextField!
    @IBOutlet private var loginButton: UIButton!
    
    // MARK: - Private Properties
    private let storageManager = StorageManager.shared
    private var user: Developer!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.delegate = self
        githubTF.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        user = nil
        loginButton.setTitle("Регистрация", for: .normal)
        nameTF.text = ""
        githubTF.text = ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "aboutUsSegue" { return true }
        
        let status = validateUser(name: nameTF.text ?? "", github: githubTF.text ?? "")
        switch status {
        case .new:
            user = Developer(name: nameTF.text ?? "", github: githubTF.text ?? "")
            storageManager.addDeveloper(developer: user)
            return true
        case .empty:
            showAlert(title: "Хм", message: "Нужно заполнить оба поля")
            return false
        case .incorect:
            showAlert(title: "Упс", message: "Такой github аккаунт уже зарегистрирован")
            return false
        case .old:
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach { viewController in
            switch viewController {
            case let selectionVS as TeamListViewController:
                selectionVS.user = user
            case let userVC as UserViewController:
                userVC.user = user
            case let developersVC as DeveloperListViewController:
                developersVC.user = user
            default: break
            }
        }
    }
    
    //MARK: - Private Methods
    private func validateUser(name: String, github: String) -> UserStatus {
        if !name.isEmpty && !github.isEmpty {
            if let developer = storageManager.getDeveloperWith(github: github) {
                if developer.name == name {
                    user = developer
                    return UserStatus.old
                } else {
                    return UserStatus.incorect
                }
            } else {
                return UserStatus.new
            }
        } else {
            return UserStatus.empty
        }
    }
}


//MARK: - UIViewController

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}


//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if validateUser(name: nameTF.text ?? "", github: githubTF.text ?? "") == UserStatus.old {
            loginButton.setTitle("Войти", for: .normal)
        } else {
            loginButton.setTitle("Регистрация", for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: - Enum userStatus
extension LoginViewController {
    enum UserStatus {
        case old
        case new
        case empty
        case incorect
    }
}

//
//  RegisterViewController.swift
//  Futebolito
//
//  Created by Mario Tromba on 08/03/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    private let registerView: RegisterView = {
        let registerView = RegisterView()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        return registerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - ViewConfiguration
extension RegisterViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(registerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: view.topAnchor),
            registerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            registerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}

extension RegisterViewController: registerViewProtocol {
    func tappedConfirm() {
        let loginView = LoginView()
        let email = loginView.emailTextField.text
        let password = loginView.passwordTextField.text
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    let homeViewController = HomeViewController()
                    self.navigationController?.pushViewController(homeViewController, animated: true)
                }
            }
        }
    }


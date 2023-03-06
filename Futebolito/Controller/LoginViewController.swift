//
//  ViewController.swift
//  Futebolito
//
//  Created by Mario Tromba on 06/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView: LoginView = {
        let loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
}

extension LoginViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(loginView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = .red
    }
}


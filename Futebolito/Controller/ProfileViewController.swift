//
//  ProfileViewController.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 09/03/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private let profileView: ProfileView = {
        let profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        profileView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

}
extension ProfileViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(profileView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "greyColor")
    }
    
}
extension ProfileViewController: PerfilViewDelegate {
    func didTapSignOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            let navigationController = UINavigationController(rootViewController: LoginViewController())
            navigationController.modalPresentationStyle = .fullScreen
            show(navigationController, sender: self)
            
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    
    
}

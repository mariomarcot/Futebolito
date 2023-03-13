//
//  RegisterViewController.swift
//  Futebolito
//
//  Created by Mario Tromba on 08/03/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var auth: Auth?
    
    private let registerView: RegisterView = {
        let registerView = RegisterView()
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        return registerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.auth = Auth.auth()
        registerView.buttonConfirm.addTarget(self, action: #selector(tappedConfirm), for: .touchUpInside)
        
    }
    @objc func tappedConfirm() {
        let password = registerView.passwordConfirmTextField.text
        let email = registerView.emailTextField.text
        
        if password.valid(.password) && email.valid(.email) {
            auth?.createUser(withEmail: email, password: password, completion: { [weak self]  result, error in
                guard let self = self else { return }
                
                if error != nil {
                    CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: error?.localizedDescription ?? "")
                } else {
                    let tabBarVC = UITabBarController()
                    
                    let homeViewController = HomeViewController()
                    let leagueViewController = LeagueViewController()
                    let newsViewController = NewsViewController()
                    let profileViewController = ProfileViewController()
                
                    homeViewController.tabBarItem = UITabBarItem(title: "Home",
                                                                 image: UIImage(systemName: "house"),
                                                                 selectedImage: UIImage(systemName: "house.fill")
                    )
                    homeViewController.tabBarItem.tag = 0
                    
                    leagueViewController.tabBarItem = UITabBarItem(title: "Ligas",
                                                                   image: UIImage(systemName: "trophy"),
                                                                   selectedImage: UIImage(systemName: "trophy.fill")
                    )
                    leagueViewController.tabBarItem.tag = 1
                    
                    newsViewController.tabBarItem = UITabBarItem(title: "Notícias",
                                                                 image: UIImage(systemName: "newspaper"),
                                                                 selectedImage: UIImage(systemName: "newspaper.fill")
                    )
                    newsViewController.tabBarItem.tag = 2
                    
                    profileViewController.tabBarItem = UITabBarItem(title: "Perfil",
                                                                    image: UIImage(systemName: "person"),
                                                                    
                                                                    selectedImage: UIImage(systemName: "person.fill")
                    )
                    profileViewController.tabBarItem.tag = 3
                    
                  
                    tabBarVC.setViewControllers([homeViewController, leagueViewController, newsViewController, profileViewController], animated: true)
                    tabBarVC.modalPresentationStyle = .fullScreen
                    tabBarVC.tabBar.isTranslucent = false
                    tabBarVC.view.tintColor = .white
                    tabBarVC.view.backgroundColor = .lightGray
                    self.navigationController?.pushViewController(tabBarVC, animated: true)
                    
                }
                
            })
        } else {
            CustomAlert(controller: self).exibe(titulo: "Atenção", mensagem: "Dados inválidos")
        }
        
        
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


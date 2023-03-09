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
        loginView.delegate = self
    }
}

//MARK: - ViewConfiguration
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
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor(named: "yellowColor")
        
    }
}

//MARK: - loginViewProtocol
extension LoginViewController: loginViewProtocol {
    func tappedLogin() {
        
        
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
        navigationController?.pushViewController(tabBarVC, animated: true)
        
    }
    
    func tappedRegister() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
}




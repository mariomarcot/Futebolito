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
        navigationItem.backButtonTitle = "Voltar"
        navigationController?.navigationBar.tintColor = UIColor(named: "greenColor")
    }
}

//MARK: - loginViewProtocol
extension LoginViewController: loginViewProtocol {
    func tappedLogin() {
        let tabBarVC = UITabBarController()
        
        let vc1 = HomeViewController()
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        let vc4 = FourthViewController()
        
        vc1.title = "Home"
        vc2.title = "Ligas"
        vc3.title = "Notícias"
        vc4.title = "Perfil"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.isTranslucent = false
        tabBarVC.view.tintColor = .red
        tabBarVC.view.backgroundColor = .white
        navigationController?.pushViewController(tabBarVC, animated: true)
        
    }
    
    func tappedRegister() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
}

class SecondViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Ligas"
    }
}

class ThirdViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Notícias"
    }
}

class FourthViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Perfil"
    }
}




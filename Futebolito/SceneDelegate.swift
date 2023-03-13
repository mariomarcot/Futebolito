//
//  SceneDelegate.swift
//  Futebolito
//
//  Created by Mario Tromba on 06/03/23.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        self.window?.makeKeyAndVisible()
        
        if Auth.auth().currentUser == nil {
            window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            
            self.window?.makeKeyAndVisible()
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
            
          let navigationController = UINavigationController(rootViewController: homeViewController)
            tabBarVC.setViewControllers([navigationController, leagueViewController, newsViewController, profileViewController], animated: true)
            tabBarVC.modalPresentationStyle = .fullScreen
            tabBarVC.tabBar.isTranslucent = false
            tabBarVC.view.tintColor = .white
            tabBarVC.view.backgroundColor = .lightGray
            window?.rootViewController = tabBarVC
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}


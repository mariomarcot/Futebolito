//
//  ProfileViewController.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 09/03/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

}
extension ProfileViewController: ViewConfiguration {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "greyColor")
    }
    
}

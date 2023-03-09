//
//  InfosTeamViewController.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 09/03/23.
//

import UIKit

class InfosTeamViewController: UIViewController {
    
    lazy var infosTeamView: InfosTeamView = {
        let infosTeamView = InfosTeamView()
        infosTeamView.translatesAutoresizingMaskIntoConstraints = false
        
        return infosTeamView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
}

//MARK: - ViewConfiguration
extension InfosTeamViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(infosTeamView)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            infosTeamView.topAnchor.constraint(equalTo: view.topAnchor),
            infosTeamView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infosTeamView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infosTeamView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
    
}

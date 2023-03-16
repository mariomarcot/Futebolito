//
//  NewsViewController.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 09/03/23.
//

import UIKit

class NewsViewController: UIViewController {
    
    private let newsView: NewsView = {
        let newsView = NewsView()
        newsView.translatesAutoresizingMaskIntoConstraints = false
        
        return newsView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

extension NewsViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(newsView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
           newsView.topAnchor.constraint(equalTo: view.topAnchor),
           newsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           newsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           newsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "greyColor")
    }
    
}

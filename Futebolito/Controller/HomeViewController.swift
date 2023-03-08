//
//  HomeViewController.swift
//  Futebolito
//
//  Created by Mario Tromba on 08/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    let cellCornerRadius: CGFloat = 10.0
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name:"KohinoorDevanagari-Light", size:30)
        titleLabel.text = ""
        titleLabel.textColor = UIColor(named: "mainYellow")
        titleLabel.textAlignment = .left
        
        return titleLabel
    }()
    
    lazy var matchsTableView : UITableView = {
        let tableview = UITableView()
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = UIColor(named: "mainBackground")
        
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureTableView()
        
    }
    
    func configureTableView(){
        matchsTableView.register(MatchTableViewCell.self, forCellReuseIdentifier: "MatchTableViewCell")
        matchsTableView.dataSource = self
        matchsTableView.delegate = self
    }
}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MatchTableViewCell", for: indexPath)
                as? MatchTableViewCell else {
            fatalError("error to create ViagemTableViewCell")
        }
        cell.layer.cornerRadius = cellCornerRadius
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    
}
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}

extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(matchsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
        
            matchsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 20),
            matchsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            matchsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            matchsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "greyColor")
        navigationItem.title = "Partidas"
    }
}

//
//  HomeViewController.swift
//  Futebolito
//
//  Created by Mario Tromba on 08/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    let cellCornerRadius: CGFloat = 10.0
    
    private lazy var buttonLeagues: UIButton = {
        let buttonLogin = UIButton()
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.setTitle("Minhas ligas", for: .normal)
        buttonLogin.backgroundColor = .white
        buttonLogin.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        buttonLogin.setTitleColor(.black, for: .normal)
        
        return buttonLogin
    }()
    private lazy var buttonFavoriteLeagues: UIButton = {
        let buttonLogin = UIButton()
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.setTitle("Todas as Ligas", for: .normal)
        buttonLogin.backgroundColor = UIColor(named: "yellowColor")
        buttonLogin.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        buttonLogin.setTitleColor(.black, for: .normal)
        
        return buttonLogin
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [buttonFavoriteLeagues, buttonLeagues])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        
        return stackView
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "greyColor")
            let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width:
            tableView.bounds.size.width, height: 30))
        let contentInset = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
        tableView.contentInset = contentInset
            headerLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            headerLabel.textColor = .black
            headerLabel.textAlignment = .center
            headerLabel.text = "Campeonato Brasileiro"
            headerView.addSubview(headerLabel)
            return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infosTeamViewController = InfosTeamViewController()
        navigationController?.pushViewController(infosTeamViewController, animated: true)
    }
}

extension HomeViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(stackView)
        view.addSubview(matchsTableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 25),
        
            matchsTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 14),
            matchsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            matchsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            matchsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    func setupAdditionalConfiguration() {
        view.backgroundColor = UIColor(named: "greyColor")
        navigationItem.title = "Partidas"
        navigationController?.navigationBar.tintColor = UIColor(named: "yellowColor")
    }
}

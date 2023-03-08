//
//  MatchTableViewCell.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 08/03/23.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    static let identifier = "MatchTableViewCell"

    private lazy var teamName1: UILabel = {
        let teamName = UILabel()
        teamName.text = "Flamengo"
        teamName.textColor = .black
        teamName.textAlignment = .center
        teamName.font = .boldSystemFont(ofSize: 12)
        teamName.numberOfLines = 0
        
        return teamName
    }()
    
    private lazy var teamImage1: UIImageView = {
        let teamImage = UIImageView()
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamImage.contentMode = .scaleAspectFill
        teamImage.image = UIImage(named: "flamengo")
    
        return teamImage
    }()
    
    private lazy var timing: UILabel = {
        let timing = UILabel()
        timing.text = "17:00"
        timing.textColor = .red
        timing.textAlignment = .center
        timing.font = .boldSystemFont(ofSize: 16)
        timing.numberOfLines = 0
        
        return timing
    }()
    
    private lazy var teamName2: UILabel = {
        let teamName = UILabel()
        teamName.text = "Corinthians"
        teamName.textColor = .black
        teamName.textAlignment = .center
        teamName.font = .boldSystemFont(ofSize: 12)
        teamName.numberOfLines = 0
        
        return teamName
    }()
    
    private lazy var teamImage2: UIImageView = {
        let teamImage = UIImageView()
        teamImage.translatesAutoresizingMaskIntoConstraints = false
        teamImage.contentMode = .scaleAspectFill
        teamImage.image = UIImage(named: "curica")
        
        return teamImage
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [teamName1, teamImage1, timing, teamImage2 ,teamName2, ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension MatchTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(stackView)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        
        ])
        
        
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
//        self.contentView.addSombra()
    }
    
    
    
}

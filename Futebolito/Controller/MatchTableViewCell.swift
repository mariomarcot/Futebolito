//
//  MatchTableViewCell.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 08/03/23.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    
    static let identifier = "MatchTableViewCell"
    
    private lazy var backgroundViews: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(named: "greyColor")
//        backgroundView.addSombra()
        return backgroundView
    }()

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
        teamImage.contentMode = .scaleAspectFit
        teamImage.image = UIImage(named: "flamengo")
    
        return teamImage
    }()
    private lazy var result: UILabel = {
        let result = UILabel()
        result.text = "3x1"
        result.textColor = .black
        result.textAlignment = .center
        result.font = .boldSystemFont(ofSize: 16)
        result.numberOfLines = 0
        
        return result
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
    private lazy var stadium: UILabel = {
        let result = UILabel()
        result.text = "Maracanã"
        result.textColor = .black
        result.textAlignment = .center
        result.font = .boldSystemFont(ofSize: 12)
        result.numberOfLines = 0
        
        return result
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
        teamImage.contentMode = .scaleAspectFit
        teamImage.image = UIImage(named: "curica")
        
        return teamImage
    }()
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [teamName1, teamImage1,stackView2, teamImage2 ,teamName2, ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        
        return stackView
        
    }()
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timing ,result, stadium])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true
        
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

//MARK: - ViewConfiguration
extension MatchTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(backgroundViews)
        contentView.addSubview(stackView)
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: 80),
            
            backgroundViews.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            backgroundViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            backgroundViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            backgroundViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            backgroundViews.heightAnchor.constraint(equalToConstant: 100),
            
        
        ])
        
        
    }
    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        
    }
    
    
    
}

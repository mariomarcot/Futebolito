//
//  InfosTeamView.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 09/03/23.
//

import UIKit

class InfosTeamView: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(named: "backgroundImage")
    
        return backgroundImage
    }()
    
    private lazy var teamName1: UILabel = {
        let teamName = UILabel()
        teamName.text = "Flamengo"
        teamName.textColor = .white
        teamName.layer.borderColor = UIColor.black.cgColor
        teamName.textAlignment = .center
        teamName.font = .boldSystemFont(ofSize: 15)
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
    
    private lazy var league: UILabel = {
        let result = UILabel()
        result.text = "Campeonato Brasileiro"
        result.textColor = .white
        result.textAlignment = .center
        result.font = .boldSystemFont(ofSize: 15)
        result.numberOfLines = 0
        
        return result
    }()
    
    private lazy var result: UILabel = {
        let result = UILabel()
        result.text = "3x1"
        result.textColor = .white
        result.textAlignment = .center
        result.font = .boldSystemFont(ofSize: 25)
        result.numberOfLines = 0
        
        return result
    }()
    
    private lazy var stadium: UILabel = {
        let stadium = UILabel()
        stadium.text = "Maracanã"
        stadium.textColor = .white
        stadium.textAlignment = .center
        stadium.font = .boldSystemFont(ofSize: 20)
        stadium.numberOfLines = 0
        
        return stadium
    }()
    
    private lazy var timing: UILabel = {
        let timing = UILabel()
        timing.text = "17:00:23"
        timing.textColor = .black
        timing.textAlignment = .center
        timing.font = .boldSystemFont(ofSize: 20)
        timing.numberOfLines = 0
        
        return timing
    }()
    
    private lazy var teamName2: UILabel = {
        let teamName = UILabel()
        teamName.text = "Corinthians"
        teamName.textColor = .white
        teamName.layer.borderColor = UIColor.black.cgColor
        teamName.textAlignment = .center
        teamName.font = .boldSystemFont(ofSize: 15)
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
        let stackView = UIStackView(arrangedSubviews: [teamImage1,teamName1])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        
        return stackView
        
    }()
    
    private lazy var stackView2: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [teamImage2 ,teamName2,])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        return stackView
        
    }()
    
    private lazy var stackView3: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [result,stadium,timing])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
 
        
        return stackView
        
    }()
    
    private lazy var stackView4: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stackView, stackView3, stackView2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
   
        
        return stackView
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension InfosTeamView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundImage)
        addSubview(league)
        addSubview(stackView4)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            stackView4.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 4),
            stackView4.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView4.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView4.heightAnchor.constraint(equalToConstant: 150),
            
            league.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            league.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            league.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            league.heightAnchor.constraint(equalToConstant: 20),
            
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 260),
            
            
            
        
        
        ])
    }
    
    
}

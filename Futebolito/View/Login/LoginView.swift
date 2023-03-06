//
//  LoginView.swift
//  Futebolito
//
//  Created by Mario Tromba on 06/03/23.
//

import UIKit

class LoginView: UIView {
    
    private lazy var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(named: "greenColor")
        backgroundView.layer.masksToBounds = true
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        return backgroundView
    }()
    
    private lazy var imageLogo: UIImageView = {
       let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.contentMode = .scaleToFill
        imageLogo.image = UIImage(named: "logoImage")
        
        return imageLogo
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailLabel, passwordLabel, buttonLogin])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
        
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel(frame: .zero)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        emailLabel.text = "E-mail"
        emailLabel.textColor = .black

        emailLabel.font = .boldSystemFont(ofSize: 16)
        
        return emailLabel
    }()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel(frame: .zero)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.numberOfLines = 0
        passwordLabel.text = "Senha"
        passwordLabel.textColor = .black
        passwordLabel.font = .boldSystemFont(ofSize: 16)
        
        return passwordLabel
    }()
    
    private lazy var buttonLogin: UIButton = {
       let buttonLogin = UIButton()
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.layer.cornerRadius = 8
        buttonLogin.setTitle("Entrar", for: .normal)
        buttonLogin.backgroundColor = UIColor(named: "yellowColor")
        buttonLogin.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        buttonLogin.setTitleColor(.black, for: .normal)
        
        return buttonLogin
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(backgroundView)
        addSubview(imageLogo)
        addSubview(stackView)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: 330),
            
            imageLogo.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
            imageLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}

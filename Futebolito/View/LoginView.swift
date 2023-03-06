//
//  LoginView.swift
//  Futebolito
//
//  Created by Mario Tromba on 06/03/23.
//

import UIKit

class LoginView: UIView {
    private lazy var userLabel: UILabel = {
        let userLabel = UILabel(frame: .zero)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.numberOfLines = 0
        userLabel.text = "Futebolito"
        userLabel.textColor = .black
        userLabel.font = .boldSystemFont(ofSize: 16)
        
        return userLabel
    }()
    
    private lazy var userLabel2: UILabel = {
        let userLabel = UILabel(frame: .zero)
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        userLabel.numberOfLines = 0
        userLabel.text = "Futebolinho"
        userLabel.textColor = .black
        userLabel.font = .boldSystemFont(ofSize: 16)
        
        return userLabel
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
        addSubview(userLabel)
        addSubview(userLabel2)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            userLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            userLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            userLabel.heightAnchor.constraint(equalToConstant: 100),
            
            userLabel2.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            userLabel2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userLabel2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            userLabel2.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

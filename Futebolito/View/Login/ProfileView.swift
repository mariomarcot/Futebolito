//
//  ProfileView.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 15/03/23.
//

import UIKit

protocol PerfilViewDelegate: AnyObject {
    
    func didTapSignOut()
}

class ProfileView: UIView {

    private lazy var exitButton: UIButton = {
        let exitButton = UIButton()
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.layer.cornerRadius = 8
        exitButton.setTitle("Sair", for: .normal)
        exitButton.backgroundColor = UIColor(named: "yellowColor")
        exitButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        exitButton.setTitleColor(.black, for: .normal)
        exitButton.addTarget(self, action: #selector(didTapSignOutButton), for: .touchUpInside)
        
        return exitButton
    }()
    
    weak var delegate: PerfilViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapSignOutButton() {
        
        delegate?.didTapSignOut()
    }
}

extension ProfileView:ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(exitButton)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            exitButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.heightAnchor.constraint(equalToConstant: 48)
        
        ])
    }
    
    
}

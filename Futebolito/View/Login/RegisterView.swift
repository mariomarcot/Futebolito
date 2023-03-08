//
//  RegisterView.swift
//  Futebolito
//
//  Created by Mario Tromba on 08/03/23.
//

import UIKit

class RegisterView: UIView {
    private lazy var imageLogo: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.contentMode = .scaleAspectFill
        imageLogo.image = UIImage(named: "logoImage")
        
        return imageLogo
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, emailLabel, emailTextField, passwordLabel, passwordTextField, passwordConfirmLabel, passwordConfirmTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        return stackView
        
    }()
    
    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        nameLabel.text = "Apelido"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 16)
        
        return nameLabel
    }()
    
    lazy var nameTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Escolha seu apelido",
            keyboardType: .default
        )
        
        textfield.didChangeSelection = {
            
        }
        
        return textfield
    }()
    
    private lazy var emailLabel: UILabel = {
        let emailLabel = UILabel(frame: .zero)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        emailLabel.text = "Seu endereço de E-mail"
        emailLabel.textColor = .black
        emailLabel.font = .boldSystemFont(ofSize: 16)
        
        return emailLabel
    }()
    
    lazy var emailTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Digite seu e-mail",
            keyboardType: .emailAddress
        )
        textfield.didTapReturnKeyboard = { self.passwordTextField.becomeFirstResponder() }

        textfield.didChangeSelection = {
            
        }
        
        return textfield
    }()
    
    private lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel(frame: .zero)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.numberOfLines = 0
        passwordLabel.text = "Escolha sua senha"
        passwordLabel.textColor = .black
        passwordLabel.font = .boldSystemFont(ofSize: 16)
        
        return passwordLabel
    }()
    
    lazy var passwordTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Coloque sua senha",
            keyboardType: .default
        )
        
        textfield.didChangeSelection = {
            
        }
        
        return textfield
    }()
    
    private lazy var passwordConfirmLabel: UILabel = {
        let passwordConfirmLabel = UILabel(frame: .zero)
        passwordConfirmLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordConfirmLabel.numberOfLines = 0
        passwordConfirmLabel.text = "Confirme sua senha"
        passwordConfirmLabel.textColor = .black
        passwordConfirmLabel.font = .boldSystemFont(ofSize: 16)
        
        return passwordConfirmLabel
    }()
    
    lazy var passwordConfirmTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Repita sua senha",
            keyboardType: .default
        )
        
        textfield.didChangeSelection = {
            
        }
        
        return textfield
    }()
    
    private lazy var buttonConfirm: UIButton = {
        let buttonConfirm = UIButton()
        buttonConfirm.translatesAutoresizingMaskIntoConstraints = false
        buttonConfirm.layer.cornerRadius = 8
        buttonConfirm.setTitle("Confirmar", for: .normal)
        buttonConfirm.backgroundColor = UIColor(named: "yellowColor")
        buttonConfirm.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        buttonConfirm.setTitleColor(.black, for: .normal)
        
        return buttonConfirm
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegisterView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(imageLogo)
        addSubview(stackView)
        addSubview(buttonConfirm)
    }
    
    func setupConstraints() {
        let screenHeight = UIScreen.main.bounds.height
        let viewHeight = screenHeight * 0.1
        NSLayoutConstraint.activate([
            imageLogo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            imageLogo.heightAnchor.constraint(equalToConstant: viewHeight),
            
            stackView.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 36),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 360),
            
            buttonConfirm.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttonConfirm.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttonConfirm.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -52)
            
        ])
    }
}

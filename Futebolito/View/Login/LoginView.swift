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
        backgroundView.clipsToBounds = true
        backgroundView.layer.cornerRadius = 50
        backgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
        let stackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField, passwordLabel, passwordTextField, buttonLogin, buttonRegister])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally

        
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
    
    lazy var emailTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Digite seu e-mail ou usuário",
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
        passwordLabel.text = "Senha"
        passwordLabel.textColor = .black
        passwordLabel.font = .boldSystemFont(ofSize: 16)
        
        return passwordLabel
    }()
    
    lazy var passwordTextField: FutebolitoTextField = {
        let textfield = FutebolitoTextField(
            placeholder: "Digite sua senha",
            keyboardType: .default
        )
        
        textfield.didChangeSelection = {
            
        }
        
        return textfield
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
    
    private lazy var buttonRegister: UIButton = {
       let buttonRegister = UIButton()
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.layer.cornerRadius = 8
        buttonRegister.setTitle("Registrar", for: .normal)
        buttonRegister.backgroundColor = UIColor(named: "yellowColor")
        buttonRegister.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        buttonRegister.setTitleColor(.black, for: .normal)
        
        return buttonRegister
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "greenColor")
        return view
    }()
    
    private lazy var signInGoogleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(named: "greenColor")?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var signInGoogleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "googleLogo")
        return image
    }()
    
    private lazy var signInGoogleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com Google"
        return label
    }()
    
    private lazy var signInAppleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(named: "greenColor")?.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var signInAppleImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "AppleLogo")
        return image
    }()
    
    private lazy var signInAppleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "Entrar com Apple"
        return label
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
        addSubview(lineView)
        addSubview(signInGoogleView)
        signInGoogleView.addSubview(signInGoogleLabel)
        signInGoogleView.addSubview(signInGoogleImageView)
        addSubview(signInAppleView)
        signInAppleView.addSubview(signInAppleLabel)
        signInAppleView.addSubview(signInAppleImageView)
 

    }
    
    func setupConstraints() {
        let screenHeight = UIScreen.main.bounds.height
        let viewHeight = screenHeight * 0.4
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundView.heightAnchor.constraint(equalToConstant: viewHeight),
            
            imageLogo.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16),
            imageLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageLogo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            imageLogo.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 260),
            

            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signInGoogleView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 30),
            signInGoogleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            signInGoogleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            signInGoogleView.heightAnchor.constraint(equalToConstant: 40),
            
            signInGoogleImageView.leadingAnchor.constraint(equalTo: signInGoogleView.leadingAnchor, constant: 52),
            signInGoogleImageView.centerYAnchor.constraint(equalTo: signInGoogleView.centerYAnchor),
            signInGoogleImageView.heightAnchor.constraint(equalToConstant: 20),
            signInGoogleImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInGoogleLabel.centerXAnchor.constraint(equalTo: signInGoogleView.centerXAnchor),
            signInGoogleLabel.centerYAnchor.constraint(equalTo: signInGoogleView.centerYAnchor),
            
            signInAppleView.topAnchor.constraint(equalTo: signInGoogleView.bottomAnchor, constant: 10),
            signInAppleView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 48),
            signInAppleView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -48),
            signInAppleView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            signInAppleView.heightAnchor.constraint(equalToConstant: 40),
            
            signInAppleImageView.leadingAnchor.constraint(equalTo: signInAppleView.leadingAnchor, constant: 52),
            signInAppleImageView.centerYAnchor.constraint(equalTo: signInAppleView.centerYAnchor),
            signInAppleImageView.heightAnchor.constraint(equalToConstant: 20),
            signInAppleImageView.widthAnchor.constraint(equalToConstant: 20),
            
            signInAppleLabel.leadingAnchor.constraint(equalTo: signInAppleImageView.trailingAnchor, constant: 20),
            signInAppleLabel.centerYAnchor.constraint(equalTo: signInAppleView.centerYAnchor)
            
            
        ])
    }
    
}

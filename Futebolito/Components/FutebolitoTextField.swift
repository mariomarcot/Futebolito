//
//  FutebolitoTextField.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 07/03/23.
//
import UIKit

class FutebolitoTextField: UIView {
    
    var text: String {
        get { textFieldIsEmpty ? textField.text! : "" }
        
        set { textField.text = newValue }
    }
    
    private var textFieldIsEmpty: Bool {
        textField.text == "" ? false : true
    }
    
    var placeholder: String
    
    var isPassword: Bool
    
    var textFieldClearButton: UITextField.ViewMode
    
    var keyboardType: UIKeyboardType
    
    var didTapReturnKeyboard: (() -> Void)?
    
    var didChangeSelection: (() -> Void)?
    
    private let insets = UIEdgeInsets(
        top: 8,
        left: 12,
        bottom: 8,
        right: 12
    )
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    private lazy var textField: CustomTextField = {
        let textfield = CustomTextField(insets: insets)
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.tintColor = UIColor(named: "mainYellow")
        textfield.placeholder = placeholder
        textfield.keyboardType = keyboardType
        textfield.clearButtonMode = textFieldClearButton
        textfield.isSecureTextEntry = isPassword
        textfield.backgroundColor = .white
        textfield.textColor = UIColor.black
        textfield.layer.borderColor = UIColor.systemGray.cgColor
        
        return textfield
    }()
    
    
    init(labelText: String = "",
         placeholder: String = "",
         keyboardType: UIKeyboardType = .default,
         clearButton: UITextField.ViewMode = .whileEditing,
         isPassword: Bool = false) {
        
        self.isPassword = isPassword
        self.textFieldClearButton = clearButton
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        
        super.init(frame: .zero)
        
        self.label.text = labelText
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FutebolitoTextField: ViewConfiguration {

    
    
    func buildViewHierarchy() {
        
        addSubview(textField)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func setupAdditionalConfiguration() {
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension FutebolitoTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didTapReturnKeyboard?()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.textField.layer.borderColor = UIColor(named: "yellowColor")?.cgColor
        self.textField.layer.borderWidth = 2
        self.label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        self.label.textColor = UIColor(named: "yellowColor")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.textField.layer.borderColor = UIColor.systemGray.cgColor
        self.textField.layer.borderWidth = 2
        self.label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        self.label.textColor = .white
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        didChangeSelection?()
    }
}

final class CustomTextField: UITextField {
    
    let insets: UIEdgeInsets
    
    init(insets: UIEdgeInsets) {
        self.insets = insets
        
        super.init(frame: .zero)
        
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        
        layer.cornerRadius = 8
        layer.borderWidth = 1.5
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: insets)
    }
}

//
//  RegViewController.swift
//  FirebaseTest
//
//  Created by Valya on 16.10.2022.
//

import UIKit
import SnapKit

class RegViewController: UIViewController {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let signUpButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        labelConstraints()
        emailTextFieldColnstraints()
        passwordTextFielddColnstraints()
        signUpButtonConctraints()
        
    }
    
// MARK: - initLabel
    func initLabel(targetLabel: UILabel, text: String, font:UIFont?, center: CGPoint) {
            
            targetLabel.font = font
            targetLabel.textColor = .black
            targetLabel.center = center
            targetLabel.textAlignment = .center
            targetLabel.numberOfLines = 2
            targetLabel.text = text
            targetLabel.lineBreakMode = .byTruncatingTail
            
            self.view.addSubview(targetLabel)
        }
    // MARK: - initTextField
    func initTextField(targetTextField: UITextField, font: UIFont?, center: CGPoint, placeholder: String) {
        targetTextField.font = font
        targetTextField.textColor = .gray
        targetTextField.placeholder = placeholder
        targetTextField.clearButtonMode = .whileEditing
        targetTextField.clearButtonMode = .unlessEditing
        targetTextField.autocapitalizationType = .none
        self.view.addSubview(targetTextField)
    }
    // MARK: - initButton
    private func initButton(targetButton: UIButton, text: String, action: Selector) {
        targetButton.backgroundColor = .black
        targetButton.layer.cornerRadius = 10
        targetButton.setTitle(text, for: .normal)
        targetButton.addTarget(self, action: action, for: .touchUpInside)
        self.view.addSubview(targetButton)
        }
    
    @objc func signUp(sender: UIButton!) {
      print("Button tapped 3")
        service.regNewUser(email: emailTextField.text!, password: passwordTextField.text!) { isReg in
            if isReg {
                self.dismiss(animated: true)
            }
        }
        
    }
    // MARK: - labelConstraints
    
    private func labelConstraints() {
        initLabel(targetLabel: label, text: "Регистрация", font: UIFont(name: "Helvetica", size: 33), center: self.view.center)
            label.snp.makeConstraints { maker in
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(200)
            }
        }
    
    // MARK: - emailTextFieldColnstraints
    private func emailTextFieldColnstraints() {
        initTextField(targetTextField: emailTextField, font: UIFont(name: "Helvetica", size: 30), center: self.view.center, placeholder: "Email")
        emailTextField.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(label).inset(100)
        }
    }
    // MARK: - passwordTextFielddColnstraints
    private func passwordTextFielddColnstraints() {
        initTextField(targetTextField: passwordTextField, font: UIFont(name: "Helvetica", size: 30), center: self.view.center, placeholder: "Password")
        passwordTextField.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(emailTextField).inset(50)
        }
    }
    //MARK: - sigInButtonConctraints
    private func signUpButtonConctraints() {
        initButton(targetButton: signUpButton, text: "Войти",action: #selector(signUp))
        signUpButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(passwordTextField).inset(50)
            maker.left.right.equalToSuperview().inset(50)
        }
    }
}



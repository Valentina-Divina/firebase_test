//
//  ViewController.swift
//  FirebaseTest
//
//  Created by Valya on 15.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let noAcButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let signInButton = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        labelConstraints()
        emailTextFieldColnstraints()
        passwordTextFielddColnstraints()
        noAcButtonConstraints()
        signInButtonConctraints()
        
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
    func initTextField(targetTextField: UITextField, font: UIFont?, center: CGPoint, placeholder: String, isSecureTextEntry: Bool) {
        targetTextField.font = font
        targetTextField.textColor = .gray
        targetTextField.placeholder = placeholder
        targetTextField.clearButtonMode = .whileEditing
        targetTextField.clearButtonMode = .unlessEditing
        targetTextField.autocapitalizationType = .none
        targetTextField.isSecureTextEntry = isSecureTextEntry
    
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
      print("Button tapped 1")
        let vc: RegViewController = RegViewController()  // ?????????????? ???? ???????????? vc
        self.present(vc, animated: true, completion: nil) 
    }
    
    @objc func singIn(sender: UIButton!) {
        service.signIn(email: emailTextField.text!, password: passwordTextField.text!) { isSign in
            if isSign {
                UserDefaults.standard.setValue(true, forKey: "isLogin")
            }
        }
      print("Button tapped 2")
        
    }
    // MARK: - labelConstraints
    
    private func labelConstraints() {
        initLabel(targetLabel: label, text: "Firebase", font: UIFont(name: "Helvetica", size: 33), center: self.view.center)
            label.snp.makeConstraints { maker in
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(200)
            }
        }
    
    // MARK: - emailTextFieldColnstraints
    private func emailTextFieldColnstraints() {
        initTextField(targetTextField: emailTextField, font: UIFont(name: "Helvetica", size: 30), center: self.view.center, placeholder: "Email", isSecureTextEntry: false)
        emailTextField.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(label).inset(100)
        }
    }
    // MARK: - passwordTextFielddColnstraints
    private func passwordTextFielddColnstraints() {
        initTextField(targetTextField: passwordTextField, font: UIFont(name: "Helvetica", size: 30), center: self.view.center, placeholder: "Password", isSecureTextEntry: true)
        passwordTextField.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(emailTextField).inset(50)
        }
    }
    //MARK: - noAcButtonConctraints
    private func noAcButtonConstraints() {
        initButton(targetButton: noAcButton, text: "?????? ????????????????", action: #selector(signUp))
        noAcButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(passwordTextField).inset(70)
            maker.left.right.equalToSuperview().inset(50)
        }
    }
    //MARK: - loginButtonConctraints
    private func signInButtonConctraints() {
        initButton(targetButton: signInButton, text: "??????????", action: #selector(singIn))
        signInButton.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(noAcButton).inset(50)
            maker.left.right.equalToSuperview().inset(50)
        }
    }
}


//
//  LoginViewController.swift
//  Click2
//
//  Created by Samik Shrotriya on 6/9/19.
//  Copyright © 2019 Click. All rights reserved.
//

import UIKit
import Hero
import Foundation
import SnapKit

class LoginViewController: UIViewController {
    
    let col2 = UIColor(displayP3Red: 0.5529, green: 0.9215, blue: 0.1882, alpha: 0.8)
    
    lazy var greenView: UIView = {
        let v = UIView()        
        v.backgroundColor = col2
        return v
    }()
    
    lazy var blackView: UIView = {
        let b = UIView()
        b.backgroundColor = UIColor.lightGray
        return b
    }()
    
    var signupButton: UIButton!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.hero.isEnabled = true
        
        greenView.hero.id = "batman"
        blackView.hero.id = "superman"
        
        greenView.layer.cornerRadius = 27
        blackView.layer.cornerRadius = 30

        view.backgroundColor = .white
        view.addSubview(greenView)
        view.addSubview(blackView)
        
        configureSignUpButton()
        configureLoginButton()
        
        setupConstraints()
        
    }
    
    func configureSignUpButton() {
        signupButton = UIButton(type: .roundedRect)
        signupButton.backgroundColor = .white
        signupButton.setTitle("SIGN UP", for: .normal)
        signupButton.setTitleColor(col2, for: .normal)
        signupButton.layer.cornerRadius = 15
        signupButton.addTarget(self, action: #selector(transIt), for: .touchUpInside)
        
        blackView.addSubview(signupButton)
        
        signupButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureLoginButton(){
        loginButton = UIButton(type: .roundedRect)
        loginButton.backgroundColor = .white
        loginButton.setTitle("LOGIN", for: .normal)
        loginButton.setTitleColor(col2, for: .normal)
        loginButton.layer.cornerRadius = 15
        loginButton.addTarget(self, action: #selector(transIt), for: .touchUpInside)
        
        blackView.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(signupButton.snp.top).offset(-10)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
        
    }
    
    @objc func transIt() {
        self.navigationController?.hero.navigationAnimationType = .fade
        self.navigationController?.pushViewController(ViewController(), animated: true)
        
    }
    
    func setupConstraints() {
        
        greenView.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.size.width / 1.511)
            make.height.equalTo(view.bounds.size.height / 14)//12.0656)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(blackView.snp.top).offset(view.bounds.size.height / -20)
        }
        
        blackView.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.size.width / 1.511)
            make.height.equalTo(view.bounds.size.height / 3)
            make.centerX.centerY.equalToSuperview()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

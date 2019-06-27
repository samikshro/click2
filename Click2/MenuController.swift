//
//  MenuController.swift
//  Click2
//
//  Created by Samik Shrotriya on 6/17/19.
//  Copyright © 2019 Click. All rights reserved.
//

import UIKit
import Hero
import SnapKit

class MenuController: UIViewController {
    
    var closeButton: UIButton!
    var blackView: UIView!
    var contactsButton: UIButton!
    var settingsButton: UIButton!
    var logoutButton: UIButton!
    
    let col2 = UIColor(displayP3Red: 0.5529, green: 0.9215, blue: 0.1882, alpha: 0.8)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hero.isEnabled = true
        
        configureBlackView()
        configureCloseButton()

    }
    
    func configureBlackView() {
        blackView = UIView()
        blackView.hero.id = "superman"
        
        blackView.backgroundColor = UIColor.lightGray
        view.addSubview(blackView)

        blackView.snp.makeConstraints { make in
            make.width.equalTo(view.bounds.size.width / 1.511)
            make.height.equalTo(view.bounds.size.height / 4)//2.039)
            make.centerX.centerY.equalToSuperview()
        }
        
        blackView.layer.cornerRadius = 30
        
        configureLogoutButton()
        configureSettingsButton()
        configureContactsButton()
    }
    
    func configureContactsButton() {
        contactsButton = UIButton(type: .roundedRect)
        contactsButton.backgroundColor = .white
        contactsButton.setTitle("CONTACTS", for: .normal)
        contactsButton.setTitleColor(col2, for: .normal)
        contactsButton.layer.cornerRadius = 15
        contactsButton.addTarget(self, action: #selector(gotoLogin), for: .touchUpInside)
        
        blackView.addSubview(contactsButton)
        
        contactsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureSettingsButton() {
        settingsButton = UIButton(type: .roundedRect)
        settingsButton.backgroundColor = .white
        settingsButton.setTitle("SETTINGS", for: .normal)
        settingsButton.setTitleColor(col2, for: .normal)
        settingsButton.layer.cornerRadius = 15
        settingsButton.addTarget(self, action: #selector(gotoLogin), for: .touchUpInside)
        
        blackView.addSubview(settingsButton)
        
        settingsButton.snp.makeConstraints { make in
//            make.bottom.equalTo(logoutButton.snp.top).offset(-20)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureLogoutButton() {
        logoutButton = UIButton(type: .roundedRect)
        logoutButton.backgroundColor = .white
        logoutButton.setTitle("LOGOUT", for: .normal)
        logoutButton.setTitleColor(col2, for: .normal)
        logoutButton.layer.cornerRadius = 15
        logoutButton.addTarget(self, action: #selector(gotoLogin), for: .touchUpInside)
        
        blackView.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-20)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    func configureCloseButton() {
        closeButton = UIButton(type: .roundedRect)
        closeButton.hero.id = "batman"
        
        closeButton.backgroundColor = col2
        closeButton.setTitle("X", for: .normal)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.width / 14, weight: UIFont.Weight(rawValue: 0.5))
        closeButton.setTitleColor(.white, for: .normal)
        closeButton.layer.cornerRadius = view.bounds.size.width / 16
        closeButton.addTarget(self, action: #selector(closeMenu), for: .touchUpInside)
        
        view.addSubview(closeButton)
        
        closeButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.left).offset(view.bounds.size.width/11)
            make.centerY.equalTo(view.snp.top).offset(view.bounds.size.width/8)
            make.width.height.equalTo(view.bounds.size.width/8)
        }

    }
    
    @objc func gotoLogin() {
//        self.navigationController?.popViewController(animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func closeMenu() {
        self.navigationController?.popViewController(animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

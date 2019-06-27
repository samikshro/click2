//
//  ViewController.swift
//  Click2
//
//  Created by Samik Shrotriya on 6/9/19.
//  Copyright © 2019 Click. All rights reserved.
//

import UIKit
import Foundation
import Hero


class ViewController: UIViewController {
    
    var clickButton: UIButton!
    var menuButton: UIButton!
    let col2 = UIColor(displayP3Red: 0.5529, green: 0.9215, blue: 0.1882, alpha: 0.8)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.hero.isEnabled = true
        
        configureMenuButton()
        configureClickButton()
        configureNavigationBar()
        
        
    }
    
    func configureMenuButton() {
        menuButton = UIButton(type: .roundedRect)
        menuButton.hero.id = "superman"

        menuButton.backgroundColor = UIColor.lightGray
        menuButton.setBackgroundImage(#imageLiteral(resourceName: "white_image2"), for: .normal)
        menuButton.layer.cornerRadius = view.bounds.size.width / 16
        menuButton.addTarget(self, action: #selector(displayMenu), for: .touchUpInside)
        
        view.addSubview(menuButton)
        
        menuButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.left).offset(view.bounds.size.width/11)
            make.centerY.equalTo(view.snp.top).offset(view.bounds.size.width/8)
            make.width.height.equalTo(view.bounds.size.width/8)
            
        }
    }
    
    func configureClickButton() {
        clickButton = UIButton(type: .roundedRect)
        clickButton.hero.id = "batman"
        
        clickButton.setTitle("Click.", for: .normal)
        clickButton.titleLabel?.font = UIFont.systemFont(ofSize: view.bounds.size.width / 12, weight: UIFont.Weight(rawValue: 0.5))
        clickButton.setTitleColor(.white, for: .normal)
        clickButton.backgroundColor = col2
        view.addSubview(clickButton)
        
        clickButton.addTarget(self, action: #selector(goBackToLogin), for: .touchUpInside)
        
        clickButton.snp.makeConstraints { make in
            make.width.height.equalTo(view.bounds.size.width/2)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        clickButton.layer.cornerRadius = view.bounds.size.width / 4
        
    }
    
    func configureNavigationBar() {
        let menuBut = UIBarButtonItem(customView: menuButton)
        navigationItem.leftBarButtonItem = menuBut
    }
    
    @objc func goBackToLogin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func displayMenu() {
        self.navigationController?.hero.navigationAnimationType = .fade
        self.navigationController?.pushViewController(MenuController(), animated: true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


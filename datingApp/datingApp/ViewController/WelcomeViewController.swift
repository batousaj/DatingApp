//
//  WelcomeViewController.swift
//  datingApp
//
//  Created by Thien Vu on 07/04/2022.
//

import Foundation
import UIKit

class WelcomeViewControllers : UIViewController {
    
    var policyText:UITextField = {
        var text = UITextField()
        text.text = NSLocalizedString("id_policy_welcome_view", comment: "")
        text.font = .systemFont(ofSize: 15)
        text.textColor = .white
        return text
    }()
    
    var crashLogIn:UITextField = {
        var text = UITextField()
        text.text = NSLocalizedString("id_crashing_welcome_view", comment: "")
        text.font = .systemFont(ofSize: 20)
        text.textColor = .white
        return text
    }()
    
    let signIn:UIButton = {
        var button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    let logIn:UIButton = {
        var button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    lazy var stackViewButton:UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [
                                    self.policyText,
                                    self.signIn,
                                    self.logIn,
                                    self.crashLogIn
                                    ])
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        return stackview
    }()
    
    let logo:LogoView = {
        let button = LogoView()
        button.customLOGO()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .systemPink
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupLogo() {
        
    }
    
    func setContraintsOfStackView() {
        
    }
}

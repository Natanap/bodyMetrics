//
//  HomeViewController.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var welcomeScrenn: WelcomeScreen = {
        let view = WelcomeScreen()
        view.goToRegister = {
            self.goToRegisterController()
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeScrenn
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    func goToRegisterController() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}



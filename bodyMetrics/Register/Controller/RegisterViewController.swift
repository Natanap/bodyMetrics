//
//  RegisterViewController.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    var registerScreen: RegisterScreen?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = registerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
}


extension RegisterViewController: RegisterScreenDelegate {
    func startPressed(viewModel: RegisterViewModel) {
        let vc = PhotoViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//
//  RegisterViewController.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

class RegisterViewController: UIViewController {

    let scrollView: UIScrollView = {
            let view = UIScrollView()
            view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .white
            return view
    }()
    
    let contentView: UIView = {
            let view = UIView()
            view.backgroundColor = .yellow
            view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
            return view
    }()
    
    var registerScreen: RegisterScreen = {
        let view = RegisterScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 900).isActive = true
        return view
    }()
    
//    override func loadView() {
//        self.registerScreen = RegisterScreen()
//        self.view = registerScreen
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        setupView()
        registerScreen.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
    }

    func setupView() {
        contentView.addSubview(registerScreen)
        registerScreen.translatesAutoresizingMaskIntoConstraints = false

        registerScreen.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        registerScreen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        registerScreen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        registerScreen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
    }
    
}


extension RegisterViewController: RegisterScreenDelegate {
    func startPressed(viewModel: RegisterViewModel) {
        let vc = PhotoViewController()
        vc.viewModel = viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

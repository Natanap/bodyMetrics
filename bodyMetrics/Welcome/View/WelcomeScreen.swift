//
//  WelcomeScreen.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

class WelcomeScreen: UIView {
    
    // MARK: - Constants
    let progressSize = UIScreen.main.bounds.size.width - 20
    let heigthView = UIScreen.main.bounds.size.height

    // MARK: - Closures
    var goToRegister: (()-> Void)?
    
    // MARK: - Variables
    var identifierProgress = 1
    var constraint: Int {
        let result = progressSize/5
        return Int(-progressSize+result)
    }
    
    // MARK: - Lazy Variables
    
    lazy var progressView: ProgressBarView = {
        let view = ProgressBarView(constraint, identifierProgress)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var womenImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "women")
       return img
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 26)
        label.text = #"Bem vindo ao "Lorem ipsum""#
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = """
        Vamos calcular seu IMC, para isso
        precisaremos de algumas informações
        """
        return label
    }()
    
    lazy var startBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor(red: 103/255, green: 80/255, blue: 164/255, alpha: 1.0)
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("Continuar", for: .normal)
        btn.addTarget(self, action: #selector(self.startPressed), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.toAddSubViews()
        self.setUPConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func startPressed() {
        self.goToRegister?()
    }
    
    private func toAddSubViews() {
        self.addSubview(self.progressView)
        self.addSubview(self.womenImage)
        self.addSubview(self.welcomeLabel)
        self.addSubview(self.messageLabel)
        self.addSubview(self.startBtn)
    }
    
    private func setUPConstraints() {
        if heigthView <= 568 {
            self.womenImage.heightAnchor.constraint(equalToConstant: 290).isActive = true
            self.womenImage.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 20).isActive = true
            welcomeLabel.font = UIFont.systemFont(ofSize: 20)
            messageLabel.font = UIFont.systemFont(ofSize: 14)
        } else if heigthView <= 667 {
            self.womenImage.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 40).isActive = true
            self.womenImage.heightAnchor.constraint(equalToConstant: 350).isActive = true
        } else {
            self.womenImage.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 60).isActive = true
            self.womenImage.heightAnchor.constraint(equalToConstant: 350).isActive = true
        }
        
        NSLayoutConstraint.activate([

            self.progressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.progressView.heightAnchor.constraint(equalToConstant: 30),
            
           
            self.womenImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            self.womenImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            self.welcomeLabel.topAnchor.constraint(equalTo: self.womenImage.bottomAnchor,constant: 30),
            self.welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.messageLabel.topAnchor.constraint(equalTo: self.welcomeLabel.bottomAnchor,constant: 20),
            self.messageLabel.centerXAnchor.constraint(equalTo: self.welcomeLabel.centerXAnchor),
            
            self.startBtn.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 30),
            self.startBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.startBtn.heightAnchor.constraint(equalToConstant: 50),
            self.startBtn.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
}

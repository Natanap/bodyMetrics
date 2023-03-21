//
//  ResultScreen.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import UIKit

class ResultScreen: UIView {
    
    
    lazy var photoResult: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var labelImc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "teste"
        label.textAlignment = .center
        return label
    }()
    
    lazy var labelResultIMC: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = "O resultado do seu IMC é :"
        return label
    }()
    
    lazy var labelResultIMCcalculte: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "000"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.toAddSubViews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func toAddSubViews() {
        self.addSubview(self.photoResult)
        self.addSubview(self.labelImc)
        self.addSubview(self.labelResultIMC)
        self.addSubview(self.labelResultIMCcalculte)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.photoResult.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.photoResult.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.photoResult.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.photoResult.heightAnchor.constraint(equalToConstant: 250),
            
            self.labelImc.topAnchor.constraint(equalTo: self.photoResult.bottomAnchor, constant: 20),
            self.labelImc.leadingAnchor.constraint(equalTo: self.photoResult.leadingAnchor),
            self.labelImc.heightAnchor.constraint(equalToConstant: 40),
            
            self.labelResultIMC.topAnchor.constraint(equalTo: self.labelImc.bottomAnchor, constant: 20),
            self.labelResultIMC.leadingAnchor.constraint(equalTo: self.photoResult.leadingAnchor),
            self.labelResultIMC.heightAnchor.constraint(equalToConstant: 40),
            
            self.labelResultIMCcalculte.topAnchor.constraint(equalTo: self.labelResultIMC.bottomAnchor,constant: 10),
            self.labelResultIMCcalculte.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelResultIMCcalculte.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

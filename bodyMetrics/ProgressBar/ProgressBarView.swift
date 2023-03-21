//
//  ProgressBarView.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

class ProgressBarView: UIView {

    lazy var oneProgressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 231/255, green: 224/255, blue: 236/255, alpha: 1.0)
        return view
    }()
    
    lazy var twoProgressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 103/255, green: 80/255, blue: 164/255, alpha: 1.0)
        
        return view
    }()
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    init(_ constraints: Int, _ indentifierProgress: Int) {
        let frame = CGRect.zero
        super.init(frame: frame)
        self.addSubViews()
        self.setUpContraints()
        self.setUpTwoProgressContraints(constraints,indentifierProgress)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        self.addSubview(self.oneProgressView)
        self.addSubview(self.twoProgressView)
        self.addSubview(self.progressLabel)
    }
    
    private func setUpTwoProgressContraints(_ constraint: Int, _ indentifierProgress: Int) {
        self.twoProgressView.trailingAnchor.constraint(equalTo: self.trailingAnchor , constant: CGFloat(constraint)).isActive = true
        self.progressLabel.text = "Passo \(indentifierProgress) de 5"
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
            self.oneProgressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.oneProgressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.oneProgressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.oneProgressView.heightAnchor.constraint(equalToConstant: 10),
            
            self.twoProgressView.topAnchor.constraint(equalTo: self.oneProgressView.topAnchor),
            self.twoProgressView.leadingAnchor.constraint(equalTo: self.oneProgressView.leadingAnchor),
            self.twoProgressView.heightAnchor.constraint(equalTo: self.oneProgressView.heightAnchor),
        
            self.progressLabel.topAnchor.constraint(equalTo: self.twoProgressView.bottomAnchor, constant: 10),
            self.progressLabel.centerXAnchor.constraint(equalTo: self.oneProgressView.centerXAnchor),
            self.progressLabel.heightAnchor.constraint(equalToConstant: 20),
            
        ])
    }
}

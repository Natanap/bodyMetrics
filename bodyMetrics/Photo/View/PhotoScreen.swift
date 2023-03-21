//
//  PhotoScreen.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 14/03/23.
//

import UIKit

protocol PhotoScreenDelegate: AnyObject {
    func photoBtnPressed()
    func startBtnPressed()
}

class PhotoScreen: UIView {
   
    private weak var delegate: PhotoScreenDelegate?
    
    
    
    public func delegate(delegate: PhotoScreenDelegate?) {
        self.delegate = delegate
    }
    
    let progressSize = UIScreen.main.bounds.size.width - 20
    
    var identifierProgress = 3
    var constraint: Int {
        let result = progressSize/5
        return Int(-progressSize+result*3)
    }
    
    lazy var progressView: ProgressBarView = {
        let view = ProgressBarView(constraint, identifierProgress)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        label.text = """
        Agora precisamos de uma
        foto do seu rosto
        """
        return label
    }()
    
    lazy var addPhotoBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        btn.backgroundColor = .systemGray5
        let image = UIImageView()
        image.image = UIImage(systemName: "square.and.arrow.up")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        btn.addSubview(image)
        image.topAnchor.constraint(equalTo: btn.topAnchor,constant: 30).isActive = true
        image.centerXAnchor.constraint(equalTo: btn.centerXAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Enviar foto"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 18)
        text.textAlignment = .center
        btn.addSubview(text)
        text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20).isActive = true
        text.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        btn.addTarget(self, action: #selector(self.photoBtnPressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.text = """
        *Sua foto não será salva nem compartilhada
        lorem ipsum dolor sit amet ipsum.
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
    
    lazy var imageFinal: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.toAddSubViews()
        self.setupConstrints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func photoBtnPressed() {
        self.delegate?.photoBtnPressed()
        
    }
    
    @objc private func startPressed() {
        self.delegate?.startBtnPressed()
    }
    
    public func adicionaImage(photo: UIImage) {
        self.addSubview(self.imageFinal)
        self.imageFinal.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imageFinal.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.imageFinal.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.imageFinal.heightAnchor.constraint(equalToConstant: 300).isActive = true
        addPhotoBtn.isHidden = true
        imageFinal.image = photo
    }
    
    private func toAddSubViews() {
        self.addSubview(self.progressView)
        self.addSubview(self.messageLabel)
        self.addSubview(self.addPhotoBtn)
        self.addSubview(self.startBtn)
        self.addSubview(self.infoLabel)
    }

    private func setupConstrints() {
        NSLayoutConstraint.activate([
            self.progressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.progressView.heightAnchor.constraint(equalToConstant: 30),
            
            self.messageLabel.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 30),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.messageLabel.heightAnchor.constraint(equalToConstant: 90),

            self.addPhotoBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.addPhotoBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.addPhotoBtn.widthAnchor.constraint(equalToConstant: 150),
            self.addPhotoBtn.heightAnchor.constraint(equalToConstant: 150),

            
        
            self.startBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.startBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.startBtn.heightAnchor.constraint(equalToConstant: 50),
            self.startBtn.widthAnchor.constraint(equalToConstant: 250),
            
            self.infoLabel.bottomAnchor.constraint(equalTo: self.startBtn.topAnchor, constant: -20),
            self.infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.infoLabel.heightAnchor.constraint(equalToConstant: 60),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
}

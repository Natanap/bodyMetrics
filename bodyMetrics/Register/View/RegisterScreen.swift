//
//  RegisterScreen.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 13/03/23.
//

import UIKit

protocol RegisterScreenDelegate: AnyObject {
    func startPressed(viewModel: RegisterViewModel)
}

class RegisterScreen: UIView {
   
    private weak var delegate: RegisterScreenDelegate?
    
    public func delegate(delegate: RegisterScreenDelegate?) {
        self.delegate = delegate
    }
    
    let progressSize = UIScreen.main.bounds.size.width - 20
    
    var identifierProgress = 2
    var constraint: Int {
        let result = progressSize/5
        return Int(-progressSize+result*2)
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
        Preencha as informações
        abaixo com seus dados:
        """
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.placeholder = "Nome"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var genderTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no //auto correção
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.placeholder = "Sexo"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var genderPickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapDone = { [weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: false)
            self.genderTextField.text = Gender.allCases[row].rawValue
            self.genderTextField.resignFirstResponder()
            
        }
        
        picker.didTapCancel = {
            self.genderTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var weightTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no //auto correção
        text.keyboardType = .numberPad
        text.backgroundColor = .white
        text.borderStyle = .roundedRect
        text.placeholder = "Peso"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var heightTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.autocorrectionType = .no //auto correção
        text.backgroundColor = .white
        text.keyboardType = .numberPad
        text.borderStyle = .roundedRect
        text.placeholder = "Altura"
        text.textColor = .darkGray
        text.clipsToBounds = true
        text.layer.cornerRadius = 2
        return text
    }()
    
    lazy var startBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor(red: 103/255, green: 80/255, blue: 164/255, alpha: 1.0)
        btn.setTitle("Continuar", for: .normal)
        btn.addTarget(self, action: #selector(self.startPressed), for: .touchUpInside)
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.toAddSubViews()
        self.setPickerView()
        self.setUpConstraints()
        self.configTextFieldDelegate()
        self.configButtonEnable(false)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func startPressed() {
        let name: String = nameTextField.text ?? ""
        let heigth: Double = Double(heightTextField.text ?? "") ?? 0
        let weight: Double = Double(weightTextField.text ?? "") ?? 0.0
        let gender: String = genderTextField.text ?? ""
        
        let viewModel = RegisterViewModel(model: RegisterModel(name: name, gender: gender, peso: weight, height: heigth))
        
        self.delegate?.startPressed(viewModel: viewModel)
    }
    
    public func configTextFieldDelegate() {
        self.nameTextField.delegate = self
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
    }
    
    private func toAddSubViews() {
        self.addSubview(self.progressView)
        self.addSubview(self.messageLabel)
        self.addSubview(self.nameTextField)
        self.addSubview(self.genderTextField)
        self.addSubview(self.weightTextField)
        self.addSubview(self.heightTextField)
        self.addSubview(self.startBtn)
        
    }
    
    private func setPickerView() {
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
    }
    
    
    func configButtonEnable(_ enable:Bool){
        //habilita o button
        
        if enable {
            self.startBtn.setTitleColor(.white, for: .normal)
            self.startBtn.isEnabled = true
        }else{
            self.startBtn.setTitleColor(.systemGray, for: .normal)
            self.startBtn.isEnabled = false
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.progressView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
            self.progressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.progressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.progressView.heightAnchor.constraint(equalToConstant: 30),
        
            self.messageLabel.topAnchor.constraint(equalTo: self.progressView.bottomAnchor, constant: 30),
            self.messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.messageLabel.heightAnchor.constraint(equalToConstant: 90),
            
            self.nameTextField.topAnchor.constraint(equalTo: self.messageLabel.bottomAnchor, constant: 20),
            self.nameTextField.leadingAnchor.constraint(equalTo: self.progressView.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.progressView.trailingAnchor),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.genderTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 20),
            self.genderTextField.leadingAnchor.constraint(equalTo: self.progressView.leadingAnchor),
            self.genderTextField.trailingAnchor.constraint(equalTo: self.progressView.trailingAnchor),
            self.genderTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.weightTextField.topAnchor.constraint(equalTo: self.genderTextField.bottomAnchor, constant: 20),
            self.weightTextField.leadingAnchor.constraint(equalTo: self.progressView.leadingAnchor),
            self.weightTextField.trailingAnchor.constraint(equalTo: self.progressView.trailingAnchor),
            self.weightTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.heightTextField.topAnchor.constraint(equalTo: self.weightTextField.bottomAnchor, constant: 20),
            self.heightTextField.leadingAnchor.constraint(equalTo: self.progressView.leadingAnchor),
            self.heightTextField.trailingAnchor.constraint(equalTo: self.progressView.trailingAnchor),
            self.heightTextField.heightAnchor.constraint(equalToConstant: 60),
            
            self.startBtn.topAnchor.constraint(equalTo: self.heightTextField.bottomAnchor, constant: 40),
            self.startBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.startBtn.heightAnchor.constraint(equalToConstant: 50),
            self.startBtn.widthAnchor.constraint(equalToConstant: 250),
            
        ])
    }
    
}



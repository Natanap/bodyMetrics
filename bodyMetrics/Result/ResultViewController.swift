//
//  ResultViewController.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import UIKit

class ResultViewController: UIViewController {

    var resultScreen: ResultScreen?
    var photoPng: UIImage?
    var viewModel: RegisterViewModel?
    
    lazy var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultScreen = ResultScreen()
        self.view = resultScreen
        if let photoPng = photoPng, let viewModel = viewModel {
            self.setImage(photo: photoPng, viewModel: viewModel)
        }
    }

    func setImage(photo: UIImage, viewModel: RegisterViewModel) {
        resultScreen?.photoResult.image = photo
        resultScreen?.labelImc.text = "Olá \(viewModel.name)!"
        self.calculaResult(viewModel: viewModel)
        resultScreen?.labelResultIMCcalculte.text = String(result.rounded(toPlaces: 2))
        
    }
    
    func calculaResult(viewModel: RegisterViewModel) {
        self.result = viewModel.peso / (viewModel.height*viewModel.height)
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


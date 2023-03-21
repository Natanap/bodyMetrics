//
//  PhotoViewController.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 14/03/23.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photoScreen: PhotoScreen?
    var imagePng: UIImage?
    var viewModel: RegisterViewModel?
    
    override func loadView() {
        self.photoScreen = PhotoScreen()
        self.view = photoScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoScreen?.delegate(delegate: self)
        self.receveidData(viewModel: self.viewModel)
    }

    override func viewWillAppear(_ animated: Bool){
        self.navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    func openCam() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }
    
    func receveidData(viewModel: RegisterViewModel?) {
        self.viewModel = viewModel
    }
}

extension PhotoViewController: PhotoScreenDelegate {
    func startBtnPressed() {
        let vc = ResultViewController()
        if let imagePng = imagePng,  let viewModel = viewModel {
            vc.photoPng = imagePng
            vc.viewModel = viewModel
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    func photoBtnPressed() {
        self.openCam()
    }

}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imagePng = image
        photoScreen?.adicionaImage(photo: image)
    }
}







// Cola Converte image em string

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
  
    func toJpegString(compressionQuality cq: CGFloat) -> String? {
        let data = self.jpegData(compressionQuality: cq)
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}

// converte String em UIimage

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
}


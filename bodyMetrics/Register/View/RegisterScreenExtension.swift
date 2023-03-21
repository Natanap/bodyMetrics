//
//  RegisterScreenExtension.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 16/03/23.
//

import Foundation
import UIKit

extension RegisterScreen: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let name = self.nameTextField.text ?? ""
        let gender = self.genderTextField.text ?? ""
        let weight = self.heightTextField.text ?? ""
        let height = self.weightTextField.text ?? ""
        
        if !name.isEmpty && !gender.isEmpty && !weight.isEmpty && !height.isEmpty {
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == nameTextField || textField == heightTextField || textField == weightTextField {
            return true
        }
        return false
    }
}


extension RegisterScreen: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == genderPickerView {
            return Gender.asArray.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == genderPickerView {
            return Gender.allCases[row].rawValue
        }
        
        return ""
    }
}


extension String {
    var isBackspace: Bool {
          let char = self.cString(using: String.Encoding.utf8)!
          return strcmp(char, "\\b") == -92
    }
}

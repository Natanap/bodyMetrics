//
//  RegisterViewModel.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import Foundation

struct RegisterViewModel {
    var model: RegisterModel?
    
    init(model: RegisterModel) {
        self.model = model
    }
    
    init() {
        self.model = RegisterModel()
    }
    
    var name: String {
        self.model?.name ?? ""
    }
    
    var gender: String {
        self.model?.gender ?? ""
    }
    
    var peso: Double {
        self.model?.peso ?? 0.0
    }
    
    var height: Double {
        self.model?.height ?? 0.0
    }
    
    
}

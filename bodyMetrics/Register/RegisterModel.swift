//
//  RegisterModel.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import Foundation

struct RegisterModel: Codable {
    let name: String
    let gender: String
    let peso: Double
    let height: Double
    
    init() {
        name = ""
        gender = ""
        peso = 0.0
        height = 0.0
    }
    
    init(name: String, gender: String, peso: Double, height: Double) {
        self.name = name
        self.gender = gender
        self.peso = peso
        self.height = height
    }
}

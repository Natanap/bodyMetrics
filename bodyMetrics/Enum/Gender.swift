//
//  Gender.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 16/03/23.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "🧔🏻‍♂️ - Masculino"
    case female = "👱🏿‍♀️ - Feminino "
    case undefined = "❓-Não especificado"

    static var asArray: [Gender] {return self.allCases}
    
    func asInt() -> Int {
            return Gender.asArray.firstIndex(of: self)!
    }
}

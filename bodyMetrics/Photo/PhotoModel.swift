//
//  PhotoModel.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import Foundation
import UIKit

struct PhotoModel{
    
    var photo: UIImage
    
    init() {
        self.photo = UIImage(named: "women")!
    }
    
    init(photo: UIImage) {
        self.photo = photo
    }

}

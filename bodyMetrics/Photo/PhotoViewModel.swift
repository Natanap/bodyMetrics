//
//  PhotoViewModel.swift
//  bodyMetrics
//
//  Created by Natanael Alves Pereira on 15/03/23.
//

import Foundation
import UIKit

struct PhotoViewModel {
    
    var model: PhotoModel?
    
    init(model: PhotoModel) {
        self.model = model
    }
    
    init(photo: UIImage) {
        self.model = PhotoModel(photo: photo)
    }

}

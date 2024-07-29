//
//  helper.swift
//  PopularArticles
//
//  Created by nargis hameed on 28/07/2024.
//

import Foundation
import UIKit

extension UIView {
    
    func makeRoundedView () {
        // Ensure the view is a square
        let width = frame.size.width
        let height = frame.size.height
        layer.cornerRadius = min(width, height) / 2
        layer.masksToBounds = true
    }
}

//
//  DropShadowView.swift
//  VK
//
//  Created by User on 12.06.2022.
//

import UIKit

class DropShadowView: UIView {
    
    var presetCornerRadius : CGFloat = 15.0
    
    override var bounds: CGRect {
        didSet {
            setupShadowPath()
        }
    }
    
    private func setupShadowPath() {
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: presetCornerRadius).cgPath
        
    }

}

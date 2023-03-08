//
//  UIView+Extension.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 08/03/23.
//

import UIKit

extension UIView {
    func addSombra() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10
    }
}

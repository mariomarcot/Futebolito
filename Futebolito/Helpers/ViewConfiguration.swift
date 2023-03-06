//
//  ViewConfiguration.swift
//  Futebolito
//
//  Created by Mario Tromba on 06/03/23.
//

import Foundation

protocol ViewConfiguration {
    
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewConfiguration {
    
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
        
    }
    
    func setupAdditionalConfiguration() {}
}

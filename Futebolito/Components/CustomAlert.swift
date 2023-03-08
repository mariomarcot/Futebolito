//
//  CustomAlert.swift
//  Futebolito
//
//  Created by Gustavo Fernandes on 08/03/23.
//
import UIKit


class CustomAlert {
    
    let controller: UIViewController
    
    var handlerFunction: (() -> Void)? = nil
    
    init(controller: UIViewController) {
        self.controller = controller
    }
        
    func exibe(titulo: String , mensagem: String) {
        
        let alertController = UIAlertController(
            title: titulo,
            message: mensagem,
            preferredStyle: .alert
        )
        
        let okButton = UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: { _ in
                
                self.handlerFunction?()
            }
        )
        
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
    }
}

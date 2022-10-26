//
//  UIViewController+Ext.swift
//  Todolistapp
//
//  Created by Nail on 26.10.22.
//

import UIKit

extension UIViewController {
    
    func alertWihtTextField(with title: String,
                            message : String,
                            actionButtonTitle : String,
                            cancelButtonTitle : String,
                            placeHolder : String,
                            completion : @escaping (String)->()){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addTextField {textfield in
            textfield.placeholder = placeHolder
        }
        let actionButton = UIAlertAction(title: actionButtonTitle, style : .default) { action in
            completion(alertController.textFields?[0].text ?? "")
        }
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
            alertController.addAction(actionButton)
            alertController.addAction(cancelButton)
            present( alertController , animated : true ,completion : nil)
        }
    }
    


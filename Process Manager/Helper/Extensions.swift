//
//  Extensions.swift
//  Process Manager
//
//  Created by Hassan on 5.5.2021.
//

import Foundation
import Cocoa

// MARK: - UIViewController Extension
extension NSViewController {
    //To show alerts
    func showAlert(message: String){
        let alert = NSAlert()
        alert.messageText = "Process Manager"
        alert.informativeText = message
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}

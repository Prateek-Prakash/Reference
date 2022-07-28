//
//  TextFieldAlertView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import SwiftUI

struct TextFieldAlertView: UIViewControllerRepresentable {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @Binding var textfieldText: String
    @Binding var showingAlert: Bool
    
    var alertTitle: String
    var alertMessage: String?
    
    func makeCoordinator() -> TextFieldAlertView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var alert: UIAlertController?
        
        var control: TextFieldAlertView
        init(_ control: TextFieldAlertView) {
            self.control = control
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            control.textfieldText = textField.text ?? ""
        }
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if self.showingAlert {
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            context.coordinator.alert = alert
            
            alert.addTextField { textField in
                textField.placeholder = "Enter Text"
                textField.text = self.textfieldText
                textField.autocapitalizationType = .allCharacters
                textField.delegate = context.coordinator
                
            }
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel) { _ in
                self.textfieldText = ""
                self.showingAlert = false
            })
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("Add", comment: ""), style: .default) { _ in
                if let textField = alert.textFields?.first, let text = textField.text {
                    self.textfieldText = text
                    self.showingAlert = false
                }
            })
            
            alert.view.tintColor = UIColor(accentColor)
            
            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true)
            }
        }
    }
}

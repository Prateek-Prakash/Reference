//
//  ImagePickerView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Binding var uiImage: UIImage?
    @Binding var isPresented: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(uiImage: $uiImage, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        pickerController.view.tintColor = UIColor(accentColor)
        return pickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Do Nothing
    }
}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var uiImage: UIImage?
    @Binding var isPresented: Bool
    
    init(uiImage: Binding<UIImage?>, isPresented: Binding<Bool>) {
        self._uiImage = uiImage
        self._isPresented = isPresented
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.uiImage = uiImage
        }
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
}

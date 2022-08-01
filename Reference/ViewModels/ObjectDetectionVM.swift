//
//  ObjectDetectionVM.swift
//  Reference
//
//  Created by Prateek Prakash on 8/1/22.
//

import SwiftUI

class ObjectDetectionVM: ObservableObject {
    @Published var cgImage: CGImage?
    
    private let context = CIContext()
    private let cameraManager = CameraManager.shared
    private let frameManager = FrameManager.shared
    
    init() {        
        frameManager.$currentBuffer
            .receive(on: RunLoop.main)
            .compactMap { buffer in
                guard let image = CGImage.create(from: buffer) else {
                    return nil
                }
                let ciImage = CIImage(cgImage: image)
                return self.context.createCGImage(ciImage, from: ciImage.extent)
            }
            .assign(to: &$cgImage)
    }
}

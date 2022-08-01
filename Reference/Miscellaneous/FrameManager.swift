//
//  FrameManager.swift
//  Reference
//
//  Created by Prateek Prakash on 8/1/22.
//

import AVFoundation

class FrameManager: NSObject, ObservableObject {
    static let shared = FrameManager()
    
    @Published var currentBuffer: CVPixelBuffer?
    
    let videoOutputQueue = DispatchQueue(label: "VideoOutputQ", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    private override init() {
        super.init()
        CameraManager.shared.setDelegate(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.currentBuffer = buffer
            }
        }
    }
}

//
//  CameraManager.swift
//  Reference
//
//  Created by Prateek Prakash on 8/1/22.
//

import AVFoundation

enum CameraStatus {
    case unconfigured
    case configured
    case unauthorized
    case failed
}

class CameraManager: ObservableObject {
    static let shared = CameraManager()
    
    let session = AVCaptureSession()
    
    private let sessionQueue = DispatchQueue(label: "CameraManager")
    private let videoOutput = AVCaptureVideoDataOutput()
    private var cameraStatus = CameraStatus.unconfigured
    
    init() {
        checkPermissions()
        sessionQueue.async {
            self.configureSession()
            self.session.startRunning()
        }
    }
    
    func checkPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            sessionQueue.suspend()
            AVCaptureDevice.requestAccess(for: .video) { authorized in
                if !authorized {
                    self.cameraStatus = .unauthorized
                }
                self.sessionQueue.resume()
            }
        case .restricted:
            cameraStatus = .unauthorized
        case .denied:
            cameraStatus = .unauthorized
        case .authorized:
            break
        @unknown default:
            cameraStatus = .unauthorized
        }
    }
    
    func configureSession() {
        guard cameraStatus == .unconfigured else {
            return
        }
        
        session.beginConfiguration()
        
        defer {
            session.commitConfiguration()
        }
        
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        guard let camera = device else {
            cameraStatus = .failed
            return
        }
        
        do {
            let cameraInput = try AVCaptureDeviceInput(device: camera)
            if session.canAddInput(cameraInput) {
                session.addInput(cameraInput)
            } else {
                cameraStatus = .failed
                return
            }
        } catch {
            cameraStatus = .failed
            return
        }
        
        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
            
            videoOutput.videoSettings =
            [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
            
            let videoConnection = videoOutput.connection(with: .video)
            videoConnection?.videoOrientation = .portrait
        } else {
            cameraStatus = .failed
            return
        }
        
        cameraStatus = .configured
    }
    
    func setDelegate(_ delegate: AVCaptureVideoDataOutputSampleBufferDelegate, queue: DispatchQueue) {
        sessionQueue.async {
            self.videoOutput.setSampleBufferDelegate(delegate, queue: queue)
        }
    }
}

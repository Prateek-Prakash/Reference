//
//  VisionVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI
import Vision

class VisionVM: ObservableObject {
    @Published var textObservation: String? = ""
    
    func recognizeText(in uiImage: UIImage?) {
        textObservation?.removeAll()
        guard let cgImage = uiImage?.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage: cgImage)
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.textObservation = self.recognizeText(from: request)
            }
        }
        request.recognitionLevel = .accurate
        do {
            try handler.perform([request])
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func recognizeText(from request: VNRequest) -> String? {
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return nil
        }
        let recognizedStrings: [String] = observations.compactMap { observation in
            guard let topCandidate = observation.topCandidates(1).first else { return nil }
            return topCandidate.string.trimmingCharacters(in: .whitespaces)
        }
        return recognizedStrings.joined(separator: "\n")
    }
}

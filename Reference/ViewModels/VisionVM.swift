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
        request.recognitionLanguages = ["en"]
        request.customWords = [
            "Reference",
            "Cloud",
            "Firestore",
            "Realtime",
            "Updates",
            "Powerful",
            "Queries",
            "And",
            "Automatic",
            "Scaling",
            "Create",
            "Databse",
        ]
        do {
            try handler.perform([request])
        } catch let error{
            print(error.localizedDescription)
        }
    }
    
    func recognizeText(from request: VNRequest) -> String? {
        var debugStrings: [String] = []
        guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return nil
        }
        var sorted = observations
        sorted.sort() {
            $0.boundingBox.midY > $1.boundingBox.midY
        }
        for observation in sorted {
            guard let topCandidate = observation.topCandidates(1).first else { return nil }
            debugStrings.append(topCandidate.string)
            debugStrings.append("--")
            debugStrings.append("Confidence: \(topCandidate.confidence.debugDescription)")
            debugStrings.append("--")
            debugStrings.append("MinX: \(observation.boundingBox.minX)")
            debugStrings.append("MidX: \(observation.boundingBox.midX)")
            debugStrings.append("MaxX: \(observation.boundingBox.maxX)")
            debugStrings.append("MinY: \(observation.boundingBox.minY)")
            debugStrings.append("MidY: \(observation.boundingBox.midY)")
            debugStrings.append("MaxY: \(observation.boundingBox.maxY)")
            debugStrings.append("Width: \(observation.boundingBox.width)")
            debugStrings.append("Height: \(observation.boundingBox.height)")
            debugStrings.append("\n")
        }
        return debugStrings.joined(separator: "\n")
    }
}

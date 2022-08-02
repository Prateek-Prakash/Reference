//
//  SpeechUtteranceView.swift
//  Reference
//
//  Created by Prateek Prakash on 8/1/22.
//

import AVFoundation
import SwiftUI

struct SpeechUtteranceView: View {
    var body: some View {
        VStack {
            List {
                Button {
                    synthesizeSpeech("Hello")
                } label: {
                    HStack {
                        Text("Hello")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
                
                Button {
                    synthesizeSpeech("Welcome")
                } label: {
                    HStack {
                        Text("Welcome")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
                
                Button {
                    synthesizeSpeech("Goodbye")
                } label: {
                    HStack {
                        Text("Goodbye")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
                
                Button {
                    synthesizeSpeech("Red Light")
                } label: {
                    HStack {
                        Text("Red Light")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
                
                Button {
                    synthesizeSpeech("Yellow Light")
                } label: {
                    HStack {
                        Text("Yellow Light")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
                
                Button {
                    synthesizeSpeech("Green Light")
                } label: {
                    HStack {
                        Text("Green Light")
                        Spacer()
                        Image(systemName: "waveform")
                    }
                }
            }
            .navigationTitle("Speech Utterance")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func synthesizeSpeech(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.pitchMultiplier = 1.0
        utterance.rate = 0.55
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

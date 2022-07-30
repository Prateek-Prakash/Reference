//
//  TextRecognitionView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI

struct TextRecognitionView: View {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @StateObject var textRecognitionVM = TextRecognitionVM()
    
    @State private var uiImage: UIImage? = nil
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentCameraPicker = false
    @State private var shouldPresentLibraryPicker = false
    @State private var shouldPresentCustomWords = false
    
    var body: some View {
        VStack {
            ScrollView {
                if let textObservation = textRecognitionVM.textObservation {
                    Text(textObservation)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Text Recognition")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Menu {
                    Section {
                        Button {
                            shouldPresentActionSheet = true
                        } label: {
                            Text("Recognize Text")
                        }
                        
                        Button {
                            shouldPresentCustomWords = true
                        } label: {
                            Text("Edit Custom Words")
                        }
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
            .actionSheet(isPresented: $shouldPresentActionSheet) { () -> ActionSheet in
                ActionSheet(
                    title: Text("Choose Image Source"),
                    buttons: [
                        ActionSheet.Button.default(Text("Camera"), action: {
                            self.shouldPresentCameraPicker = true
                        }),
                        ActionSheet.Button.default(Text("Library"), action: {
                            self.shouldPresentLibraryPicker = true
                        }),
                        ActionSheet.Button.cancel()
                    ]
                )
            }
            .fullScreenCover(isPresented: $shouldPresentCameraPicker) {
                ImagePickerView(sourceType: .camera, uiImage: self.$uiImage, isPresented: self.$shouldPresentCameraPicker)
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $shouldPresentLibraryPicker) {
                ImagePickerView(sourceType: .photoLibrary, uiImage: self.$uiImage, isPresented: self.$shouldPresentLibraryPicker)
                    .ignoresSafeArea(edges: .bottom)
            }
            .sheet(isPresented: $shouldPresentCustomWords) {
                CustomWordsView(customWords: $textRecognitionVM.customWords)
                    .accentColor(accentColor)
            }
            .onChange(of: uiImage) { selectedImage in
                textRecognitionVM.recognizeText(in: selectedImage)
            }
        }
    }
}

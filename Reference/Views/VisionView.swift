//
//  VisionView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/26/22.
//

import SwiftUI

struct VisionView: View {
    @StateObject var visionVM = VisionVM()
    
    @State private var uiImage: UIImage? = nil
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentCameraPicker = false
    @State private var shouldPresentLibraryPicker = false
    
    var body: some View {
        VStack {
            ScrollView {
                if let textObservation = visionVM.textObservation {
                    Text(textObservation)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                        .font(.system(size: 12, design: .monospaced))
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Vision")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        shouldPresentActionSheet = true
                    } label: {
                        Image(systemName: "doc.viewfinder")
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
                }
            }
            .onChange(of: uiImage) { selectedImage in
                visionVM.recognizeText(in: selectedImage)
            }
        }
    }
}
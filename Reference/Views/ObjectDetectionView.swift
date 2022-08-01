//
//  ObjectDetectionView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import SwiftUI

struct ObjectDetectionView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var objectDetectionVM = ObjectDetectionVM()
    
    var body: some View {
        VStack {
            ZStack {
                // Frame View
                if let image = objectDetectionVM.cgImage {
                    GeometryReader { geo in
                        Image(decorative: image, scale: 1.0, orientation: .up)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                            .clipped()
                            .ignoresSafeArea(.all)
                    }
                } else {
                    EmptyView()
                        .ignoresSafeArea(.all)
                }
                
                // Exit Button
                VStack {
                    let foregroundColor = colorScheme == .light ?
                    Color(red: 97/255, green: 97/255, blue: 95/255, opacity: 95/100) :
                    Color(red: 148/255, green: 150/255, blue: 152/255, opacity: 95/100)
                    
                    let backgroundColor = colorScheme == .light ?
                    Color(red: 243/255, green: 246/255, blue: 240/255, opacity: 95/100) :
                    Color(red: 32/255, green: 36/255, blue: 38/255, opacity: 95/100)
                    
                    Spacer()
                    
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(foregroundColor)
                            .padding()
                    }
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .shadow(radius: 4)
                }
                .padding()
            }
            .navigationTitle("Object Detection")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

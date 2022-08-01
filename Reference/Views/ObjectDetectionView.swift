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
                    Image(decorative: image, scale: 1.0, orientation: .up)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .ignoresSafeArea()
                } else {
                    EmptyView()
                        .ignoresSafeArea()
                }
                
                // Lights Indicator
                VStack {
                    let backgroundColor = colorScheme == .light ?
                    Color(red: 243/255, green: 246/255, blue: 240/255, opacity: 95/100) :
                    Color(red: 32/255, green: 36/255, blue: 38/255, opacity: 95/100)
                    
                    let dRed = colorScheme == .light ?
                    Color(red: 255/255, green: 59/255, blue: 48/255, opacity: 5/100) :
                    Color(red: 255/255, green: 69/255, blue: 58/255, opacity: 5/100)
                    let bRed = colorScheme == .light ?
                    Color(red: 255/255, green: 59/255, blue: 48/255, opacity: 100/100) :
                    Color(red: 255/255, green: 69/255, blue: 58/255, opacity: 100/100)
                    
                    let dYellow = colorScheme == .light ?
                    Color(red: 255/255, green: 204/255, blue: 0/255, opacity: 5/100) :
                    Color(red: 255/255, green: 214/255, blue: 10/255, opacity: 5/100)
                    let bYellow = colorScheme == .light ?
                    Color(red: 255/255, green: 204/255, blue: 0/255, opacity: 100/100) :
                    Color(red: 255/255, green: 214/255, blue: 10/255, opacity: 100/100)
                    
                    let dGreen = colorScheme == .light ?
                    Color(red: 52/255, green: 199/255, blue: 89/255, opacity: 5/100) :
                    Color(red: 48/255, green: 209/255, blue: 88/255, opacity: 5/100)
                    let bGreen = colorScheme == .light ?
                    Color(red: 52/255, green: 199/255, blue: 89/255, opacity: 100/100) :
                    Color(red: 48/255, green: 209/255, blue: 88/255, opacity: 100/100)
                    
                    HStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(objectDetectionVM.lightsFound ? bRed : dRed)
                            .shadow(color: .red, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .shadow(color: .red, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .padding(.vertical)
                            .padding(.leading)
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(objectDetectionVM.lightsFound ? bYellow : dYellow)
                            .shadow(color: .yellow, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .shadow(color: .yellow, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .padding()
                        
                        Image(systemName: "circle.fill")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(objectDetectionVM.lightsFound ? bGreen : dGreen)
                            .shadow(color: .green, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .shadow(color: .green, radius: objectDetectionVM.lightsFound ? 4 : 0)
                            .padding(.vertical)
                            .padding(.trailing)
                    }
                    .background(backgroundColor)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .shadow(radius: 4)
                    
                    Spacer()
                }
                .padding()
                
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

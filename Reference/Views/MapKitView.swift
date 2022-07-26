//
//  MapKitView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/25/22.
//

import MapKit
import SwiftUI

struct MapKitView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var coordRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.331699,
            longitude: -122.030190
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.0075,
            longitudeDelta: 0.0075
        )
    )
    
    var body: some View {
        VStack {
            ZStack {
                Map(coordinateRegion: $coordRegion)
                    .ignoresSafeArea()
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
                        Text("EXIT")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                            .foregroundColor(foregroundColor)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 40)
                    }
                    .background(backgroundColor)
                    .cornerRadius(100)
                    .shadow(radius: 5)
                    .shadow(radius: 5)
                }
                .padding()
            }
            .navigationTitle("MapKit")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct MapKitView_Preview: PreviewProvider {
    static var previews: some View {
        MapKitView()
    }
}

//
//  VLCKitPlayerView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import SwiftUI

struct VLCKitPlayerView: View {
    @AppStorage("accentColor") var accentColor: Color = .red
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Button {
                isPresented = false
            } label: {
                Text("CLOSE VIEW")
            }
        }
        .accentColor(accentColor)
    }
}

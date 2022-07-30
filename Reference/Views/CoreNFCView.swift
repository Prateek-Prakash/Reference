//
//  CoreNFCView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import SwiftUI

struct CoreNFCView: View {
    @State var nfcHelper = NFCHelper()
    
    var body: some View {
        VStack {
            VStack {
                Button {
                    nfcHelper.scan(mode: .read)
                } label: {
                    HStack {
                        Image(systemName: "wave.3.right.circle.fill")
                            .font(.system(size: 25))
                        Text("READ NFC TAG")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .padding(.horizontal)
                .padding(.top)
                
                Divider()
                    .padding()
                
                Button {
                    nfcHelper.scan(mode: .write, text: UUID().uuidString)
                } label: {
                    HStack {
                        Image(systemName: "wave.3.right.circle.fill")
                            .font(.system(size: 25))
                        Text("WRITE NFC TAG")
                            .font(.system(size: 20, weight: .heavy, design: .rounded))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Core NFC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

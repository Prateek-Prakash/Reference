//
//  CoreNFCView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/30/22.
//

import SwiftUI

struct CoreNFCView: View {
    @State var nfcManager = NFCManager()
    
    var body: some View {
        VStack {
            List {
                Button {
                    nfcManager.scan(mode: .read)
                } label: {
                    HStack {
                        Text("Read NFC Tag")
                        Spacer()
                        Image(systemName: "wave.3.right.circle.fill")
                    }
                }
                
                Button {
                    nfcManager.scan(mode: .write, text: UUID().uuidString)
                } label: {
                    HStack {
                        Text("Write NFC Tag")
                        Spacer()
                        Image(systemName: "wave.3.right.circle.fill")
                    }
                }
            }
            .navigationTitle("Core NFC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

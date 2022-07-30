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
            List {
                Button {
                    nfcHelper.scan(mode: .read)
                } label: {
                    Text("Read NFC Tag")
                }
                Button {
                    nfcHelper.scan(mode: .write, text: UUID().uuidString)
                } label: {
                    Text("Write NFC Tag")
                }
            }
            .navigationTitle("Core NFC")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

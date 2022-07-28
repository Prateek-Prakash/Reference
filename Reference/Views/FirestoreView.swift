//
//  FirestoreView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Firebase
import SwiftUI

struct FirestoreView: View {
    @State var firestoreNetworkAccess = true
    
    var body: some View {
        VStack {
            List {
                
            }
            .navigationTitle("Firestore")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        firestoreNetworkAccess.toggle()
                        if firestoreNetworkAccess {
                            Firestore.firestore().enableNetwork()
                            print("Firestore Network Access: ENABLED")
                        } else {
                            Firestore.firestore().disableNetwork()
                            print("Firestore Network Access: DISABLED")
                        }
                    } label: {
                        Image(systemName: firestoreNetworkAccess ? "antenna.radiowaves.left.and.right" : "antenna.radiowaves.left.and.right.slash")
                    }
                }
            }
        }
    }
}

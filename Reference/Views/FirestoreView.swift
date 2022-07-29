//
//  FirestoreView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Firebase
import SwiftUI

struct FirestoreView: View {
    @StateObject var firestoreVM = FirestoreVM()
    
    @State var firestoreNetworkAccess = true
    
    var body: some View {
        VStack {
            VStack {
                if !firestoreVM.contacts.isEmpty {
                    List(firestoreVM.contacts) { contact in
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "star.fill")
                                    .font(.system(size: 13))
                                    .foregroundColor(contact.favorite ? Color(.systemYellow) : Color(.systemGray4))
                                    .padding(.trailing)
                            }
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text(contact.name)
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(.primary)
                                Text(contact.phone)
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(.secondary)
                                Text(contact.id)
                                    .font(.system(size: 10, weight: .thin))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .listStyle(.plain)
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Firestore")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        firestoreVM.addMockContact()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

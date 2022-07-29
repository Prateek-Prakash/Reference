//
//  FirestoreVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Firebase
import SwiftUI

class FirestoreVM: ObservableObject {
    @Published var contacts: [Contact] = []
    
    init() {
        Task {
            initContactsListener()
        }
    }
    
    func initContactsListener() {
        let firestoreDb = Firestore.firestore()
        firestoreDb.collection("contacts").order(by: "name").addSnapshotListener { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    self.contacts = snapshot?.documents.map {
                        Contact(
                            id: $0.documentID,
                            name: $0["name"] as? String ?? "NIL FIELD",
                            phone: $0["phone"] as? String ?? "NIL FIELD",
                            favorite: $0["favorite"] as? Bool ?? false
                        )
                    } ?? []
                }
            }
        }
    }
    
    func addMockContact() {
        let contact = Contact.mock()
        let firestoreDb = Firestore.firestore()
        firestoreDb.collection("contacts").document(contact.id).setData([
            "name": contact.name,
            "phone": contact.phone,
            "favorite": false
        ]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Added Contact: \(contact.id)")
            }
        }
    }
}

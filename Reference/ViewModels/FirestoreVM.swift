//
//  FirestoreVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import Firebase
import SwiftUI

class FirestoreVM: ObservableObject {
    @AppStorage("loginStatus") var loginStatus = false
    
    @Published var loaded: Bool = false
    @Published var contacts: [Contact] = []
    
    private var contactsListener: ListenerRegistration?
    
    init() {
        Task {
            initContactsListener()
            DispatchQueue.main.async {
                self.loaded = true
            }
        }
    }
    
    deinit {
        contactsListener?.remove()
    }
    
    func initContactsListener() {
        let firestoreDb = Firestore.firestore()
        if let uid = Auth.auth().currentUser?.uid {
            contactsListener = firestoreDb.collection(uid).order(by: "name").addSnapshotListener { snapshot, error in
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
    }
    
    func addMockContact() {
        let contact = Contact.mock()
        let firestoreDb = Firestore.firestore()
        if let uid = Auth.auth().currentUser?.uid {
            firestoreDb.collection(uid).document(contact.id).setData([
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
    
    func toggleFavoriteContact(id: String) {
        if let contact = contacts.first(where: { $0.id == id }) {
            let firestoreDb = Firestore.firestore()
            if let uid = Auth.auth().currentUser?.uid {
                firestoreDb.collection(uid).document(contact.id).updateData([
                    "favorite": !contact.favorite
                ]) { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Toggled Favorite: \(contact.id)")
                    }
                }
            }
        }
    }
    
    func deleteContact(id: String) {
        if let contact = contacts.first(where: { $0.id == id }) {
            let firestoreDb = Firestore.firestore()
            if let uid = Auth.auth().currentUser?.uid {
                firestoreDb.collection(uid).document(contact.id).delete() { error in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("Deleted Contact: \(contact.id)")
                    }
                }
            }
        }
    }
}

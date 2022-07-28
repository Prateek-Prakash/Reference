//
//  CustomWordsView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import SwiftUI

struct CustomWordsView: View {
    @Binding var customWords: [String]
    
    @State var newWord = ""
    @State var showingAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                TextFieldAlertView(textfieldText: $newWord, showingAlert: $showingAlert, alertTitle: "New Custom Word")
                List {
                    ForEach(customWords, id: \.self) { word in
                        Text(word)
                    }
                    .onDelete { indexSet in
                        if let index = indexSet.first {
                            customWords.remove(at: index)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Custom Words")
            .toolbar {
                ToolbarItem {
                    Button {
                        newWord = ""
                        showingAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .onChange(of: showingAlert) { showing in
                if !showing && !newWord.isEmpty {
                    let cleanWord = newWord.trimmingCharacters(in: .whitespaces).uppercased()
                    customWords.append(cleanWord)
                    newWord = ""
                }
            }
        }
    }
}

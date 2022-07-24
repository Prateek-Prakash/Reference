//
//  VariousLabelsView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/24/22.
//

import SwiftUI

struct VariousLabelsView: View {
    var body: some View {
        VStack {
            List {
                Section("Basic Label") {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Authentication", systemImage: "lock.fill")
                            .labelStyle(.titleOnly)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Notifications", systemImage: "bell.badge.fill")
                            .labelStyle(.titleOnly)
                            .badge(10)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Configuration", systemImage: "gearshape.2.fill")
                            .labelStyle(.titleOnly)
                    }
                }
                
                Section("Icon Label") {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Authentication", systemImage: "lock.fill")
                            .foregroundColor(.white)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Notifications", systemImage: "bell.badge.fill")
                            .foregroundColor(.white)
                            .badge(10)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Configuration", systemImage: "gearshape.2.fill")
                            .foregroundColor(.white)
                    }
                }
                
                Section("Colored Icon Label") {
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Authentication", systemImage: "lock.fill")
                            .labelStyle(ColoredIconLabelStyle(color: .green, size: 1))
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Notifications", systemImage: "bell.badge.fill")
                            .labelStyle(ColoredIconLabelStyle(color: .red, size: 1))
                            .badge(10)
                    }
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Label("Configuration", systemImage: "gearshape.2.fill")
                            .labelStyle(ColoredIconLabelStyle(color: .gray, size: 1))
                    }
                }
            }
            .navigationTitle("Various Labels")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//
//  MusicKitView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import CachedAsyncImage
import SwiftUI

struct MusicKitView: View {
    @StateObject var musicKitVM = MusicKitVM()
    
    var body: some View {
        VStack {
            List {
                ForEach(musicKitVM.results) { song in
                    HStack {
                        CachedAsyncImage(url: song.artwork?.url(width: 75, height: 75), urlCache: .imageCache) { imagePhase in
                            switch imagePhase {
                            case .success(let asyncImage):
                                asyncImage
                                    .resizable()
                                    .aspectRatio(1.0, contentMode: .fill)
                            default:
                                Color.secondary
                                    .opacity(0.2)
                                    .aspectRatio(1.0, contentMode: .fill)
                            }
                        }
                        .frame(width: 75, height: 75)
                        .mask(RoundedRectangle(cornerRadius: 8.0))
                        VStack(alignment: .leading) {
                            Text(song.title)
                                .font(.headline)
                            Text(song.artistName)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("MusicKit")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $musicKitVM.query, placement: .navigationBarDrawer(displayMode: .always), prompt: "Songs")
            .autocapitalization(.words)
            .disableAutocorrection(true)
            .onSubmit(of: .search) {
                Task {
                    await musicKitVM.search()
                }
            }
            .onChange(of: musicKitVM.query) { query in
                if query.isEmpty {
                    musicKitVM.reset()
                }
            }
        }
    }
}

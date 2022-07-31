//
//  LazyGridView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import CachedAsyncImage
import SwiftUI

struct LazyGridView: View {
    @StateObject var lazyGridVM = LazyGridVM()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100.0, maximum: 150.0), spacing: 10.0)], spacing: 10.0) {
                    if let movies = lazyGridVM.movies {
                        ForEach(movies.indices, id: \.self) { index in
                            let movie = movies[index]
                            if let poster = lazyGridVM.fetchPoster(path: movie.posterPath) {
                                CachedAsyncImage(url: poster, urlCache: .imageCache) { imagePhase in
                                    switch imagePhase {
                                    case .success(let asyncImage):
                                        asyncImage
                                            .resizable()
                                            .aspectRatio(2.0/3.0, contentMode: .fill)
                                    default:
                                        Color.secondary
                                            .opacity(0.2)
                                            .aspectRatio(2.0/3.0, contentMode: .fill)
                                    }
                                }
                                .mask(RoundedRectangle(cornerRadius: 8.0))
                                .onAppear {
                                    if index == movies.count - 5 {
                                        Task {
                                            await lazyGridVM.fetchMovies()
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .navigationTitle("Lazy Grid")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

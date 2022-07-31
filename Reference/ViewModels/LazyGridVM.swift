//
//  LazyGridVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import SwiftUI
import TMDb

class LazyGridVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    var nextPage = 1
    
    init() {
        TMDbAPI.setAPIKey(AppConfig.tmdbKey)
        Task {
            await fetchMovies()
        }
    }
    
    func fetchMovies() async {
        do {
            let page = try await TMDbAPI.shared.movies.popular(page: nextPage)
            DispatchQueue.main.async {
                self.movies.append(contentsOf: page.results)
            }
            nextPage += 1
        } catch {
            print(error.localizedDescription)
        }
    }
}

//
//  MusicKitVM.swift
//  Reference
//
//  Created by Prateek Prakash on 7/31/22.
//

import MusicKit
import SwiftUI

class MusicKitVM: ObservableObject {
    @Published var query: String = ""
    @Published var results: MusicItemCollection<Song> = []
    
    func search() async {
        let status = await MusicAuthorization.request()
        switch status {
        case .authorized:
            var request = MusicCatalogSearchRequest(term: query, types: [Song.self])
            request.limit = 25
            do {
                let result = try await request.response()
                DispatchQueue.main.async {
                    self.results = result.songs
                }
            } catch {
                print(error.localizedDescription)
            }
            break
        default:
            break
        }
    }
    
    func reset() {
        DispatchQueue.main.async {
            self.results = []
        }
    }
}

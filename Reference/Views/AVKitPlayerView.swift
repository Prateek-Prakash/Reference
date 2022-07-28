//
//  AVKitPlayerView.swift
//  Reference
//
//  Created by Prateek Prakash on 7/28/22.
//

import AVKit
import SwiftUI

struct AVKitPlayerView: View {
    var videoURL: String
    
    @State var avPlayer = AVPlayer()
    
    var body: some View{
        AVKitPlayer(avPlayer: self.avPlayer)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                self.avPlayer.replaceCurrentItem(with: AVPlayerItem(url: URL(string: self.videoURL)!))
                self.avPlayer.play()
            }
    }
}

struct AVKitPlayer: UIViewControllerRepresentable {
    var avPlayer: AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AVKitPlayer>) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.player = self.avPlayer
        playerController.showsPlaybackControls = true
        playerController.exitsFullScreenWhenPlaybackEnds = true
        playerController.allowsPictureInPicturePlayback = true
        return playerController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<AVKitPlayer>) {
        // Empty
    }
}

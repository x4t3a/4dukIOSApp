//
//  PlayerView.swif.swift
//  4duk
//
//  Created by Andrey Dunaev on 07.03.2020.
//  Copyright © 2020 Andrey Dunaev. All rights reserved.
//

import SwiftUI
import AVFoundation
import MediaPlayer

class Player {
    private var player: AVPlayer?
    var isPlaying: Bool = false
    var url = URL(string: "http://radio.4duk.ru/4duk128.mp3")!
    var playerItem: AVPlayerItem?
    var asset: AVAsset {
        AVAsset(url: self.url)
    }
    let requiredAssetKeys = [
        "playable"
    ]

    init?() {
        setupRemoteTransportControls()
    }
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()

        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            if !self.isPlaying {
                self.play()
                return .success
            }
            return .commandFailed
        }

        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.isPlaying {
                self.stop()
                return .success
            }
            return .commandFailed
        }
    }

    func play() {
        if !isPlaying {
            self.playerItem = AVPlayerItem(asset: self.asset, automaticallyLoadedAssetKeys: requiredAssetKeys)
            self.playerItem?.automaticallyPreservesTimeOffsetFromLive = true
            self.player = AVPlayer(playerItem: self.playerItem)
            guard let unboxed = self.player else {
                debugPrint("Player isn't initialized!")
                return
            }
            unboxed.play()
            isPlaying = true
            debugPrint("play!")
        }
    }

    func stop() {
        if isPlaying {
            playerItem = nil
            player = nil
            isPlaying = false
            debugPrint("stop!")
        }
    }

    func toggle() {
        if isPlaying {
            self.stop()
        } else {
            self.play()
        }
    }
}

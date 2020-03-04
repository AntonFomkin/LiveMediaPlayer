//
//  MediaPlayer.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 27.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//


import UIKit
import AVFoundation


final class MediaPlayer: AudioPlayer {
    
    var progressTimer: Timer?
    {
        willSet {
            progressTimer?.invalidate()
        }
    }
    
    
    var progressUpdate: ((_ currentValue: Float) -> ())?
    var progressEndUpdate: (() -> ())?
    var messageContainerUpdate: ((_ visible: Bool) -> ())?
    var labelTimePlayStartUpdate: ((_ value: String) -> ())?
    var labelTimePlayEndUpdate: ((_ value: String) -> ())? 
    
    var player: AVPlayer?
    var playerItem: AVPlayerItem?
    let seconds: Int64 = 15
    let timeScale: Int32 = 1
    
    // MARK: Rewind media
    func rewind (type: RewindType) -> () {
        if let player = self.player {
            if let playerItem = self.playerItem {
                
                let rewindValue : CMTime = CMTimeMake(value: seconds, timescale: timeScale)
                
                switch type {
                case .left:
                    
                    if player.currentTime() - rewindValue > CMTime.zero {
                        player.seek(to: player.currentTime() - rewindValue)
                    } else {
                        player.seek(to: playerItem.duration)
                    }
                    
                case .right :
                    if player.currentTime() + rewindValue < playerItem.duration {
                        player.seek(to: player.currentTime() + rewindValue)
                    } else {
                        player.seek(to: playerItem.duration)
                    }
                }
            }
        }
    }
    
    // MARK: MediaPlayer init
    func playMedia(url: String) {
        
        DispatchQueue.main.async { [weak self] in
            
            if let player = self?.player {
                if player.status == .readyToPlay {
                    print(player.status)
                    self?.stopProgressTimer()
                    player.pause()
                } else {
                    self?.startProgressTimer()
                    player.play()
                }
            } else {
                
                
                if let urlStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    if let TempURL = URL.init(string: urlStr) {
                        self?.playerItem = AVPlayerItem(url: TempURL)
                        self?.player = AVPlayer(playerItem: self?.playerItem)
                        self?.player?.currentItem?.preferredForwardBufferDuration = TimeInterval(10)
                        self?.player?.automaticallyWaitsToMinimizeStalling = true
                        
                        
                        self?.startProgressTimer()
                        self?.player?.play()
                        NotificationCenter.default.addObserver(self!, selector: #selector(self?.playerItemPlayToEndTime), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self?.playerItem)
                        
                    }
                }
            }
        }
    }
    
    
    // MARK: Play Time Ended
    @objc func playerItemPlayToEndTime() {
        stopProgressTimer()
        self.progressEndUpdate?()
        
        if let player = self.player {
            player.replaceCurrentItem(with: playerItem)
            player.seek(to: CMTime.zero)
            
        }
    }
    
    // MARK: Stop Timer
    func stopProgressTimer() {
        progressTimer?.invalidate()
        progressTimer = nil
    }
    
    // MARK: Start Timer
    func startProgressTimer() {
        progressTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateProgressTimer), userInfo: nil, repeats: true)
    }
    
    // MARK: Progress Timer and buffering
    @objc func updateProgressTimer() {
        DispatchQueue.main.async { [weak self] in
            
            if let playerItem = self?.playerItem {
                if let player = self?.player {
                    
                    let currentTime = Float(CMTimeGetSeconds(player.currentTime()))
                    let durationTime = Float(CMTimeGetSeconds(playerItem.duration))
                    
                    self?.messageContainerUpdate?(false)
                    
                    switch player.status {
                    case .readyToPlay:
                        if playerItem.isPlaybackLikelyToKeepUp {
                            self?.messageContainerUpdate?(true)
                            self?.progressUpdate?(currentTime / durationTime)
                            self?.labelTimePlayStartUpdate?(player.currentTime().stringValue)
                            self?.labelTimePlayEndUpdate?(playerItem.duration.stringValue)
                            
                            print("Playing ")
                            
                        } else
                            
                            if playerItem.isPlaybackBufferEmpty {
                                print("Buffer empty - show loader")
                            }  else if playerItem.isPlaybackBufferFull {
                                print("Buffer full - hide loader")
                            } else {
                                print("Buffering")
                        }
                    case .failed:
                        print("Failed ")
                    case .unknown:
                        print("Unknown ")
                    default:
                        break
                    }
                }
            }
        }
    }
    
}


//
//  Protocols.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 27.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//


import AVFoundation

enum RewindType {
    case left,right
}

protocol AudioPlayer: class {

    var player: AVPlayer? { get set }
    var playerItem: AVPlayerItem? { get set }
    var progressUpdate: ((_ currentValue: Float) -> ())? { get set }
    var progressEndUpdate: (() -> ())? { get set }
    var messageContainerUpdate: ((_ visible: Bool) -> ())? { get set }
    var labelTimePlayStartUpdate: ((_ value: String) -> ())? { get set }
    var labelTimePlayEndUpdate: ((_ value: String) -> ())? { get set }
    
    
    func playMedia(url: String)
    func stopProgressTimer()
    func startProgressTimer()
    func rewind (type: RewindType) -> ()
}

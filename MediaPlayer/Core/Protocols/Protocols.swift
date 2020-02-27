//
//  Protocols.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 27.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit
import AVFoundation

protocol AudioPlayer {
    var player: AVPlayer? { get set }
    var playerItem: AVPlayerItem? { get set }
     
    func playMedia(url: String)
}

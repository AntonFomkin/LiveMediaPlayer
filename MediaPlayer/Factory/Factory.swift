//
//  Factory.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 04.03.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import Foundation

enum MediaPlayerManager {
    case typeOne
}

class MediaPlayerFactory {
    
    func getPlayer (type: MediaPlayerManager) -> (AudioPlayer) {
        switch type {
        case .typeOne:
            return MediaPlayer()
        }
    }
}

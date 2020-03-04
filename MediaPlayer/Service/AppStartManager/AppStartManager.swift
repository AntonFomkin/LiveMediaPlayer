//
//  AppStartManager.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 24.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let mediaPlayer = MediaPlayerFactory().getPlayer(type: .typeOne)
        window?.rootViewController = MediaPlayerVC(mediaPlayer: mediaPlayer)
        window?.makeKeyAndVisible()
    }
    
}

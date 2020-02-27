//
//  OtherExtension.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 27.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import Foundation
import CoreMedia

extension CMTime {
    var stringValue: String {
        let totalSeconds = Int(self.seconds)
        let hours = totalSeconds / 3600
        let minutes = totalSeconds % 3600 / 60
        let seconds = totalSeconds % 3600 % 60
        if hours > 0 {
            return String(format: "%i:%02i:%02i", hours, minutes, seconds)
        } else {
            return String(format: "%02i:%02i", minutes, seconds)
        }
    }
}

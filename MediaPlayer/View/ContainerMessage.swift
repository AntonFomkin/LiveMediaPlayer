//
//  ContainerMessage.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 26.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit

final class ContainerMessage: UIView {

    override func draw(_ rect: CGRect) {
        
        self.layer.backgroundColor = UIColor.mp_messageColor.cgColor
        self.layer.cornerRadius = 15
        
        self.layer.shadowColor = UIColor.mp_imageShadow.cgColor
        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5
    }

}

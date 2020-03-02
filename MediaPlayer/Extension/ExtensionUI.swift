//
//  ExtensionUI.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 25.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit


extension UILabel{
    func setCharacterSpacing(_ spacing: CGFloat){
        let attributedStr = NSMutableAttributedString(string: self.text ?? "")
        attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
        self.attributedText = attributedStr
    }
}

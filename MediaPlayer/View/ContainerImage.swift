//
//  ContainerImage.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 26.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit

final class ContainerImage: UIView {
    
    private(set) lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "RelaxImage.png")
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 20
        image.layer.cornerRadius = self.layer.cornerRadius
        image.clipsToBounds = true
        addImage()
    }
    
    private func addImage() {
        
        self.addSubview(self.image)
        NSLayoutConstraint.activate([
            self.image.heightAnchor.constraint(equalToConstant: self.frame.height),
            self.image.widthAnchor.constraint(equalToConstant: self.frame.width)
        ])
    }
    
    override func draw(_ rect: CGRect) {
         
        self.layer.shadowColor = UIColor.mp_lightBlueGrey.cgColor
        self.layer.shadowOffset = CGSize(width: 7.0, height: 5.0)
        self.layer.shadowRadius = 14.0
        self.layer.shadowOpacity = 1
    }
}


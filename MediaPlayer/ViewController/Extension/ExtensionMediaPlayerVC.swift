//
//  ExtensionMediaPlayerVC.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 24.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit

extension MediaPlayerVC {
       
    // MARK: Configure closures
    func configureMediaPlayerClosure() {
       
        self.mediaPlayer.progressUpdate = { [weak self] result in
                self?.progressTrack.progress = result
            }
            
            self.mediaPlayer.progressEndUpdate = {
                self.progressTrack.progress = 0.0
                self.timeStartLabel.text = self.zeroTime
                self.timeEndLabel.text = self.zeroTime
                self.playButton.setImage(UIImage(named: self.playButtonName)?.withRenderingMode(.alwaysOriginal), for: .normal)
                self.playButton.tag = 2
            }
            
            self.mediaPlayer.messageContainerUpdate = { [weak self] visible in
                self?.loadViewMessage.isHidden = visible
            }
            
            self.mediaPlayer.labelTimePlayStartUpdate = { [weak self] value in
                self?.timeStartLabel.text = value
            }
            
            self.mediaPlayer.labelTimePlayEndUpdate = { [weak self] value in
                self?.timeEndLabel.text = value
            
        }
    }
    
    // MARK: Configure events pressed Button
    func configurePressedButtonEvents() {
            
            self.playButton.addTarget(self, action: #selector(self.playButtonPressed), for: .touchUpInside)
            self.rewindLeftButton.addTarget(self, action: #selector(self.rewindLeftButtonPressed), for: .touchUpInside)
            self.rewindRightButton.addTarget(self, action: #selector(self.rewindRightButtonPressed), for: .touchUpInside)
            self.tabButtonLeft.addTarget(self, action: #selector(self.tabButtonLeftPressed), for: .touchUpInside)
            self.tabButtonCenter.addTarget(self, action: #selector(self.tabButtonCenterPressed), for: .touchUpInside)
            self.tabButtonRight.addTarget(self, action: #selector(self.tabButtonRightPressed), for: .touchUpInside)
    }
    
    // MARK: Configure UI
    func configureUIControls() {
        
            
            self.view.addSubview(self.mainView)
            
            NSLayoutConstraint.activate([
                self.mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 9.0),
                self.mainView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0.0),
                self.mainView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0.0),
                self.mainView.heightAnchor.constraint(equalToConstant: self.view.frame.height),
                self.mainView.widthAnchor.constraint(equalToConstant: self.view.frame.width)
            ])
            
            
            self.view.addSubview(self.containerImage)
            
            NSLayoutConstraint.activate([
                self.containerImage.topAnchor.constraint(equalTo: self.mainView.topAnchor, constant: 24.0),
                self.containerImage.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 20.0),
                self.containerImage.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -20.0),
                self.containerImage.heightAnchor.constraint(equalToConstant: 376.0),
                self.containerImage.widthAnchor.constraint(equalToConstant: 335.0)
            ])
            
            self.view.addSubview(self.nameTrack)
            
            NSLayoutConstraint.activate([
                self.nameTrack.topAnchor.constraint(equalTo: self.containerImage.bottomAnchor, constant: 20.0),
                self.nameTrack.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 21.0),
                self.nameTrack.heightAnchor.constraint(equalToConstant: 34.0),
                self.nameTrack.widthAnchor.constraint(equalToConstant: 334.0)
            ])
            
            self.view.addSubview(self.nameArtist)
            
            NSLayoutConstraint.activate([
                self.nameArtist.topAnchor.constraint(equalTo: self.nameTrack.bottomAnchor, constant: 20.0),
                self.nameArtist.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 138.0),
                self.nameArtist.heightAnchor.constraint(equalToConstant: 17.0),
                self.nameArtist.widthAnchor.constraint(equalToConstant: 100.0)
            ])
            
            
            self.view.addSubview(self.rewindLeftButton)
            
            NSLayoutConstraint.activate([
                self.rewindLeftButton.topAnchor.constraint(equalTo: self.nameArtist.bottomAnchor, constant: 46.0),
                self.rewindLeftButton.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 72.0),
                self.rewindLeftButton.heightAnchor.constraint(equalToConstant: 40.0),
                self.rewindLeftButton.widthAnchor.constraint(equalToConstant: 40.0)
            ])
            
            self.view.addSubview(self.playButton)
            
            NSLayoutConstraint.activate([
                self.playButton.topAnchor.constraint(equalTo: self.nameArtist.bottomAnchor, constant: 46.0),
                self.playButton.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 178.0),
                self.playButton.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -168.0),
                self.playButton.heightAnchor.constraint(equalToConstant: 40.0),
                self.playButton.widthAnchor.constraint(equalToConstant: 40.0)
            ])
            
            
            
            self.view.addSubview(self.rewindRightButton)
            
            NSLayoutConstraint.activate([
                self.rewindRightButton.topAnchor.constraint(equalTo: self.nameArtist.bottomAnchor, constant: 46.0),
                self.rewindRightButton.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -71.0),
                self.rewindRightButton.heightAnchor.constraint(equalToConstant: 40.0),
                self.rewindRightButton.widthAnchor.constraint(equalToConstant: 40.0)
            ])
            
            self.view.addSubview(self.progressTrack)
            
            NSLayoutConstraint.activate([
                self.progressTrack.topAnchor.constraint(equalTo: self.playButton.bottomAnchor, constant: 37.0),
                self.progressTrack.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 20.0),
                self.progressTrack.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -20.0),
                self.progressTrack.heightAnchor.constraint(equalToConstant: 4.0),
            ])
            
            self.view.addSubview(self.timeStartLabel)
            
            NSLayoutConstraint.activate([
                self.timeStartLabel.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor, constant: 2.0),
                self.timeStartLabel.leftAnchor.constraint(equalTo: self.progressTrack.leftAnchor, constant: 0.0),
                self.timeStartLabel.heightAnchor.constraint(equalToConstant: 18.0),
                self.timeStartLabel.widthAnchor.constraint(equalToConstant: 89.0)
            ])
            
            self.view.addSubview(self.timeEndLabel)
            
            NSLayoutConstraint.activate([
                self.timeEndLabel.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor, constant: 2.0),
                self.timeEndLabel.rightAnchor.constraint(equalTo: self.progressTrack.rightAnchor, constant: 0.0),
                self.timeEndLabel.heightAnchor.constraint(equalToConstant: 18.0),
                self.timeEndLabel.widthAnchor.constraint(equalToConstant: 89.0)
            ])
            
            self.loadViewMessage.addSubview(self.loadLabelMessage)
            NSLayoutConstraint.activate([
                self.loadLabelMessage.centerXAnchor.constraint(equalTo: self.loadViewMessage.centerXAnchor),
                self.loadLabelMessage.centerYAnchor.constraint(equalTo: self.loadViewMessage.centerYAnchor),
                self.loadLabelMessage.heightAnchor.constraint(equalToConstant: 18.0),
                self.loadLabelMessage.widthAnchor.constraint(equalToConstant: 78.0)
            ])
            
            self.view.addSubview(self.loadViewMessage)
            
            NSLayoutConstraint.activate([
                self.loadViewMessage.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor, constant: 32.0),
                self.loadViewMessage.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 113.0),
                self.loadViewMessage.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -114.0),
                self.loadViewMessage.heightAnchor.constraint(equalToConstant: 28.0),
               
            ])
            
            self.view.addSubview(self.tabButtonLeft)
            let safeArea = self.view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                self.tabButtonLeft.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor,constant: 79.0),
                self.tabButtonLeft.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -20.0),
                self.tabButtonLeft.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 72.0),
                self.tabButtonLeft.heightAnchor.constraint(equalToConstant: 26.0),
                self.tabButtonLeft.widthAnchor.constraint(equalToConstant: 26.0)
            ])
            
               
            self.view.addSubview(self.tabButtonCenter)
            
            NSLayoutConstraint.activate([
                self.tabButtonCenter.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor, constant: 79.0),
                self.tabButtonCenter.leftAnchor.constraint(equalTo: self.mainView.leftAnchor, constant: 175.0),
                self.tabButtonCenter.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -174.0),
                self.tabButtonCenter.heightAnchor.constraint(equalToConstant: 28.0),
                self.tabButtonCenter.widthAnchor.constraint(equalToConstant: 28.0)
            ])
            
            self.view.addSubview(self.tabButtonRight)
            
            NSLayoutConstraint.activate([
                self.tabButtonRight.topAnchor.constraint(equalTo: self.progressTrack.bottomAnchor, constant: 79.0),
                self.tabButtonRight.rightAnchor.constraint(equalTo: self.mainView.rightAnchor, constant: -69.0),
                self.tabButtonRight.heightAnchor.constraint(equalToConstant: 28.0),
                self.tabButtonRight.widthAnchor.constraint(equalToConstant: 28.0)
            ])
        
    }
    
    // MARK: Play Media
    @objc func playButtonPressed() {
        
        DispatchQueue.main.async { [weak self] in
            let linksData = AudioDataLinks()
            let currentLink = linksData.networkLinks[1]
            
            
            if let player = self?.mediaPlayer.player {
                
                switch self?.playButton.tag {
                case 1:
                    self?.mediaPlayer.stopProgressTimer()
                    player.pause()
                    print("pause")
                    self?.playButton.setImage(UIImage(named: self!.playButtonName)?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self?.playButton.tag = 2
                    break
                case 2:
                    self?.mediaPlayer.startProgressTimer()
                    player.play()
                    print("play")
                    self?.playButton.setImage(UIImage(named: self!.pauseButtonName)?.withRenderingMode(.alwaysOriginal), for: .normal)
                    self?.playButton.tag = 1
                    break
                default:
                    break
                }
                
            } else {
                self?.playButton.setImage(UIImage(named: self!.pauseButtonName)?.withRenderingMode(.alwaysOriginal), for: .normal)
                self?.playButton.tag = 1
                self?.mediaPlayer.playMedia(url: currentLink)
            }
        }
    }
    
    
    @objc func rewindLeftButtonPressed() {
        print("rewind Left button Pressed")
        if let _ = self.mediaPlayer.player {
            mediaPlayer.rewind(type: .left)//rewindLeft()
        }
    }

    
    @objc func rewindRightButtonPressed() {
        print("rewind Right button Pressed")
        if let _ = self.mediaPlayer.player {
            mediaPlayer.rewind(type: .right)//rewindRight()
        }
    }
    
    
    @objc func tabButtonLeftPressed() {
        print("tabButtonLeft button Pressed")
    }
    
    @objc func tabButtonCenterPressed() {
        print("tabButtonCenter button Pressed")
    }
    
    @objc func tabButtonRightPressed() {
        print("tabButtonRight button Pressed")
    }
    
}

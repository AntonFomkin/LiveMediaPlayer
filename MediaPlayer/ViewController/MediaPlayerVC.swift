//
//  MediaPlayerVC.swift
//  MediaPlayer
//
//  Created by Anton Fomkin on 24.02.2020.
//  Copyright © 2020 Anton Fomkin. All rights reserved.
//

import UIKit
import AVFoundation


final class MediaPlayerVC: UIViewController {
    
    private(set) lazy var zeroTime: String = {
        return "00:00"
    }()
    
    let playButtonName = "Polygon1.png"
    let pauseButtonName = "filled.png"
    
    
    private(set) lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.backgroundColor = UIColor.mp_backView.cgColor
        mainView.layer.cornerRadius = 30
        
        return mainView
    }()
    
    private(set) lazy var containerImage: ContainerImage = {
        let containerImage = ContainerImage()
        containerImage.translatesAutoresizingMaskIntoConstraints = false
        
        return containerImage
    }()
    
    private(set) lazy var nameTrack: UILabel = {
        let nameTrack = UILabel()
        nameTrack.translatesAutoresizingMaskIntoConstraints = false
        nameTrack.text = "ELLIE GOULDING"
        nameTrack.textAlignment = .center
        nameTrack.textColor = UIColor.mp_nameTrack
        nameTrack.font = UIFont(name: "Montserrat-Bold", size: 28)
        nameTrack.setCharacterSpacing(-0.33)
        nameTrack.numberOfLines = 0
        
        return nameTrack
    }()
    
    private(set) lazy var nameArtist: UILabel = {
        let nameArtist = UILabel()
        nameArtist.translatesAutoresizingMaskIntoConstraints = false
        nameArtist.text = "HATE ME"
        nameArtist.textAlignment = .center
        nameArtist.textColor = UIColor.mp_nameArtist
        nameArtist.font = UIFont(name: "Montserrat-Medium", size: 14)
        nameArtist.setCharacterSpacing(-0.16)
        nameArtist.numberOfLines = 0
        
        return nameArtist
    }()
    
    private(set) lazy var playButton: UIButton = {
        let playButton = UIButton(type: .system)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setImage(UIImage(named: playButtonName)?.withRenderingMode(.alwaysOriginal), for: .normal)
        playButton.tag = 1
        playButton.layer.cornerRadius = 3.0
        
        return playButton
    }()
    
    private(set) lazy var rewindLeftButton: UIButton = {
        let rewindLeftButton = UIButton(type: .system)
        rewindLeftButton.alpha = 0.7
        rewindLeftButton.translatesAutoresizingMaskIntoConstraints = false
        rewindLeftButton.setImage(UIImage(named: "backArrow.png")?.withRenderingMode(.alwaysOriginal), for: .normal)

        return rewindLeftButton
    }()
    
    private(set) lazy var rewindRightButton: UIButton = {
        let rewindRightButton = UIButton(type: .system)
        rewindRightButton.alpha = 0.7
        rewindRightButton.translatesAutoresizingMaskIntoConstraints = false
        rewindRightButton.setImage(UIImage(named: "group10.png")?.withRenderingMode(.alwaysOriginal), for: .normal)

        return rewindRightButton
    }()
    
    private(set) lazy var progressTrack: UIProgressView = {
        let progressTrack = UIProgressView()
        progressTrack.translatesAutoresizingMaskIntoConstraints = false
        progressTrack.progressTintColor = UIColor.mp_messageColor
        progressTrack.progress = 0.0
        progressTrack.layer.backgroundColor = UIColor.white.cgColor 
        progressTrack.layer.cornerRadius = 2.0
        
        return progressTrack
    }()
    
    private(set) lazy var timeStartLabel: UILabel = {
        let timeStartLabel = UILabel()
        timeStartLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStartLabel.text = self.zeroTime
        timeStartLabel.textAlignment = .left
        timeStartLabel.textColor = UIColor.mp_nameTrack
        timeStartLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        timeStartLabel.setCharacterSpacing(-0.16)
        timeStartLabel.numberOfLines = 0
        
        return timeStartLabel
    }()
    
    private(set) lazy var timeEndLabel: UILabel = {
        let timeEndLabel = UILabel()
        timeEndLabel.translatesAutoresizingMaskIntoConstraints = false
        timeEndLabel.text = self.zeroTime
        timeEndLabel.textAlignment = .right
        timeEndLabel.textColor = UIColor.mp_nameTrack
        timeEndLabel.font = UIFont(name: "Montserrat-Medium", size: 14)
        timeEndLabel.setCharacterSpacing(-0.16)
        timeEndLabel.numberOfLines = 0
        
        return timeEndLabel
    }()
    
    private(set) lazy var loadViewMessage: ContainerMessage = {
        let loadViewMessage = ContainerMessage()
        loadViewMessage.translatesAutoresizingMaskIntoConstraints = false
        loadViewMessage.isHidden = true
        return loadViewMessage
    }()
    
    private(set) lazy var loadLabelMessage: UILabel = {
        let loadLabelMessage = UILabel()
        loadLabelMessage.translatesAutoresizingMaskIntoConstraints = false
        loadLabelMessage.text = "Загрузка ..."
        loadLabelMessage.textAlignment = .center
        loadLabelMessage.textColor = UIColor.mp_loadLabelMessage
        loadLabelMessage.font = UIFont(name: "Montserrat-Medium", size: 14)
        loadLabelMessage.setCharacterSpacing(-0.16)
        loadLabelMessage.numberOfLines = 0
        
        return loadLabelMessage
    }()
    
    private(set) lazy var tabButtonLeft: UIButton = {
        let tabButtonLeft = UIButton(type: .system)
        tabButtonLeft.translatesAutoresizingMaskIntoConstraints = false
        tabButtonLeft.setImage(UIImage(named: "share.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return tabButtonLeft
    }()
    
    private(set) lazy var tabButtonCenter: UIButton = {
        let tabButtonCenter = UIButton(type: .system)
        tabButtonCenter.translatesAutoresizingMaskIntoConstraints = false
        tabButtonCenter.setImage(UIImage(named: "refresh.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return tabButtonCenter
    }()
    
    private(set) lazy var tabButtonRight: UIButton = {
        let tabButtonRight = UIButton(type: .system)
        tabButtonRight.translatesAutoresizingMaskIntoConstraints = false
        tabButtonRight.setImage(UIImage(named: "download.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return tabButtonRight
    }()
    

    
    var mediaPlayer: AudioPlayer
    
    init(mediaPlayer: AudioPlayer) {
        self.mediaPlayer = mediaPlayer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.mp_messageColor
        
        // MARK: Configure UI & Events & Closure
        configureMediaPlayerClosure()
        configureUIControls()
        configurePressedButtonEvents()
    }
}

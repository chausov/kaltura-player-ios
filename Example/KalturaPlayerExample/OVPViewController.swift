//
//  ViewController.swift
//  KalturaPlayerExample
//
//  Created by Vadik on 21/11/2017.
//  Copyright © 2017 kaltura. All rights reserved.
//

import UIKit
import KalturaPlayer
import PlayKit
import PlayKitOVP

let ovpBaseUrl = "http://cdnapisec.kaltura.com"
let ovpPartnerId: Int64 = 2215841
let ovpEntryId = "1_w9zx2eti"
let uiconfId = 41188731

class OVPViewController: UIViewController {
    
    var player: KalturaOvpPlayer?
    var playheadTimer: Timer?
    @IBOutlet weak var playerContainer: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var playerOptions = KalturaPlayerOptions()
        playerOptions.serverUrl = ovpBaseUrl
        playerOptions.preload = true
        playerOptions.uiManager = DefaultKalturaUIMananger()
        playerOptions.partnerId = ovpPartnerId
        
        PlayerConfigManager.shared.retrieve(by: uiconfId, baseUrl: ovpBaseUrl, partnerId: ovpPartnerId, ks: nil) { (uiConf, error) in
            playerOptions.uiConf = uiConf
            self.player = KalturaOvpPlayer.create(pluginConfig: nil, options: playerOptions)
            
            let mediaOptions = OVPMediaOptions(entryId: ovpEntryId)
            self.player?.loadMedia(mediaOptions: mediaOptions)
            self.player?.view = self.playerContainer
        }
    }
}


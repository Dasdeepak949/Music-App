//
//  ViewController.swift
//  Music App
//
//  Created by CREAGX on 21/02/18.
//  Copyright © 2018 SRIM. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    @IBOutlet weak var musicTitle_Lbl: UILabel!
    @IBOutlet weak var musicImage_Img: UIImageView!
    
    var player = MPMusicPlayerController.systemMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Helper.sharedInstance.musicAuthorization()
        setup_Music_Player()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup_Music_Player() {
        
        let mediaItems = MPMediaQuery.songs().items
        let mediaCollection = MPMediaItemCollection(items: mediaItems!)
        
        player.setQueue(with: mediaCollection)
        
        musicImage_Img.image = player.nowPlayingItem?.artwork?.image(at: musicImage_Img.bounds.size)
        if(musicImage_Img.image == nil){
            musicImage_Img.image = UIImage(named:"musicBg")
        }
        musicTitle_Lbl.text = player.nowPlayingItem?.title
    }
    
    @IBAction func play_Btn_Touch_Event(_ sender: Any) {
   
        player.play()
        
    }
    
    @IBAction func pause_Btn_Touch_Event(_ sender: Any) {
        
        player.pause()
    }
    
    @IBAction func next_Btn_Touch_Event(_ sender: Any) {
        
        player.skipToNextItem()
        musicTitle_Lbl.text = player.nowPlayingItem?.title
        
        musicImage_Img.image = player.nowPlayingItem?.artwork?.image(at: musicImage_Img.bounds.size)
        if(musicImage_Img.image == nil){
            musicImage_Img.image = UIImage(named:"musicBg")
        }
    }
    
    @IBAction func previous_Btn_Touch_Event(_ sender: Any) {
        
        player.skipToPreviousItem()
        musicTitle_Lbl.text = player.nowPlayingItem?.title
        
        musicImage_Img.image = player.nowPlayingItem?.artwork?.image(at: musicImage_Img.bounds.size)
        if(musicImage_Img.image == nil){
            musicImage_Img.image = UIImage(named:"musicBg")
        }
    }
}


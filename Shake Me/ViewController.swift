//
//  ViewController.swift
//  Shake Me
//
//  Created by Jared Allen on 4/1/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["comedy_male_yelling_yee_ha",
                  "comedy_zips_pops_and_bonks",
                  "comedy_accent_crash_and_burn",
                  "boing_comical_accent",
                  "quick_buzzer_like_a_game_show_wrong_answer_"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event?.subtype == UIEventSubtype.MotionShake {
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            let audioFilePath = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
                
                do {
                    
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioFilePath!))
                    
                    player.play()
                    
                } catch {
                    
                    // Process error here
                    
                }

                
            }
        
    }


}


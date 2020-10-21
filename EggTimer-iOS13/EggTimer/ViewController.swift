//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    var timer = Timer()
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        self.secondsPassed = 0
        self.titleLabel.text = hardness
        self.progressBar.progress = 0.0
            
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed <= self.totalTime {
                
                self.progressBar.progress = Float(self.secondsPassed) / Float(self.totalTime)
                
                self.secondsPassed += 1
            } else {
                Timer.invalidate()
                self.titleLabel.text = "DONE"
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()
            }
        }
        
    }
    
}

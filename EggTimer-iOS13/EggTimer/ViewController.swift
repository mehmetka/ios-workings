//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var timer = Timer()
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        var secondsRemaining = eggTimes[sender.currentTitle!]!
            
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
                print ("Finish!")
                self.titleLabel.text = "DONE"
            }
        }
        
    }
}

//
//  toneViewController.swift
//  LetMuGO
//
//  Created by Janhon on 2018/10/25.
//  Copyright © 2018 ImProve. All rights reserved.
//

import UIKit
import AVFoundation
import StoreKit

class toneViewController: UIViewController {
    
    @IBOutlet var toneButton: [UIButton]!
    
    var audioPlayer : AVAudioPlayer!
    
    let soundArray = ["pianoC", "pianoD", "pianoE", "pianoF", "pianoG", "pianoA", "pianoB","pianoC2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tonePressed(_ sender: UIButton) {
        playSound(soundFileName: soundArray[sender.tag])
        toneButton[sender.tag].contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
    }
    
    
    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        for button in toneButton{
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        }
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    
    func playSound(soundFileName : String) {
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch  {
            print(error)
        }
        audioPlayer.play()
    }

}

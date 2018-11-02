//
//  ViewController.swift
//  LetMuGO
//
//  Created by Janhon on 2018/10/24.
//  Copyright © 2018 ImProve. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds


class ViewController: UIViewController {
    @IBOutlet weak var indexView: UIImageView!
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet var imageView: UIImageView!
    
    
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let str = NSLocalizedString("CFBundleDisplayName", comment: "title")
        print(str)
        let request = GADRequest()
        bannerView.adUnitID = "ca-app-pub-5799388280198989/9699056235"
        bannerView.rootViewController = self
        bannerView.load(request)
        
        request.testDevices = [ kGADSimulatorID ]
        

    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        playSound(soundFileName: "guitar")
        
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


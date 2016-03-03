//
//  NewSoundViewController.swift
//  Soundboard
//
//  Created by Jianfeng Yang on 2/28/16.
//  Copyright © 2016 Jianfeng Yang. All rights reserved.
//

import UIKit

class NewSoundViewController : UIViewController {
    @IBOutlet weak var newSoundName: UITextField!
    
    var previousViewController = SoundListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // other stuff...
    }
    
    @IBAction func cancelTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveTapped(sender: AnyObject) {
        var sound = Sound()
        sound.name = self.newSoundName.text!
        self.previousViewController.sounds.append(sound)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func recordTapped(sender: AnyObject) {
        if self.audioRecorder.recording {
            self.audioRecorder.stop()
            self.recordButton.setTitle("RECORD", forState: UIControlState.Normal)

        } else {
            let session = AVAudioSession.sharedInstance()
            try! session.setActive(true)
            self.audioRecorder.record()
            self.recordButton.setTitle("Finish recording", forState: UIControlState.Normal)
        }
    }
    
}
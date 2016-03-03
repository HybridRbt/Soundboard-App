//
//  NewSoundViewController.swift
//  Soundboard
//
//  Created by Jianfeng Yang on 2/28/16.
//  Copyright © 2016 Jianfeng Yang. All rights reserved.
//

import UIKit
import AVFoundation

class NewSoundViewController : UIViewController {
    required init?(coder aDecoder : NSCoder) {
        let baseString : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        let pathComponents = [baseString, "MyAudio.m4a"]
        self.audioURL = NSURL.fileURLWithPathComponents(pathComponents)!
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        var recordSettings : [String : AnyObject] = Dictionary()
        
        recordSettings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC)
        recordSettings[AVSampleRateKey] = 44100.0
        recordSettings[AVNumberOfChannelsKey] = 2
        
        try! self.audioRecorder = AVAudioRecorder(URL: self.audioURL, settings: recordSettings)
        self.audioRecorder.meteringEnabled = true
        self.audioRecorder.prepareToRecord()
        
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var newSoundName: UITextField!
    
    var audioRecorder : AVAudioRecorder
    var audioURL : NSURL
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
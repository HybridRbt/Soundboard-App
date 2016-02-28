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
}
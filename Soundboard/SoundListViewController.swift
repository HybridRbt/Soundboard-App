//
//  SoundListViewController.swift
//  Soundboard
//
//  Created by Jianfeng Yang on 2/28/16.
//  Copyright © 2016 Jianfeng Yang. All rights reserved.
//

import UIKit
import AVFoundation

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel!.text = "LALLAAL"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let soundPath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        let soundURL = NSURL.fileURLWithPath(soundPath!)
        
        try! self.audioPlayer = AVAudioPlayer(contentsOfURL: soundURL)
        self.audioPlayer.play()
    }
}


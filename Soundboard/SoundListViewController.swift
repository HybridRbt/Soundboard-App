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
    var sounds: [Sound] = []  //list for the sounds

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        var sound1 = Sound()
        sound1.name = "Movie quote"
        sound1.URL = getSoundURLFromFileName("movie_quote", fileType: "mp3")
        
        self.sounds.append(sound1)
        
        var sound2 = Sound()
        sound2.name = "Movie quote2"
        sound2.URL = getSoundURLFromFileName("movie_quote", fileType: "mp3")
        
        self.sounds.append(sound2)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sounds.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var sound = self.sounds[indexPath.row]
        var cell = UITableViewCell()
        cell.textLabel!.text = sound.name
        return cell
    }
    
    func getSoundURLFromFileName(fileName: String, fileType: String) -> NSURL {
        let soundPath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
        let soundURL = NSURL.fileURLWithPath(soundPath!)
        
        return soundURL
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let soundURL = getSoundURLFromFileName("movie_quote", fileType: "mp3")
        
        try! self.audioPlayer = AVAudioPlayer(contentsOfURL: soundURL)
        self.audioPlayer.play()
    }
}


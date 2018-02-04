//
//  ViewController.swift
//  slideShowApp
//
//  Created by 勝良祥吾 on 2018/02/03.
//  Copyright © 2018年 shougo.katsura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer:Timer!
    var timer_sec: Float = 0
    var imageCount: Int = 0
    
    let image:[UIImage] = [#imageLiteral(resourceName: "image1"),#imageLiteral(resourceName: "image2"),#imageLiteral(resourceName: "image3")]
    

    @IBOutlet weak var playStopButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        if imageCount == 0 {
            imageCount = image.count - 1
        } else {
            imageCount -= 1
        }
        imageView.image = image[imageCount]
    }
    
    @IBAction func nextButton(_ sender: Any) {
        imageNext()
    }
    
    
    @IBAction func playStopButton(_ sender: Any) {
        if timer == nil {
            playStopButton.setTitle("停止", for: UIControlState.normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            pauseTimer()
        }
    }
    
    @objc func updateTimer(timer: Timer) {
        self.timer_sec += 0.1
        imageNext()
    }
    
    func pauseTimer(){
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.timer_sec = 0
            playStopButton.setTitle("再生", for: UIControlState.normal)
        }
    }
    
    func imageNext(){
        if imageCount + 1 != image.count{
            imageCount += 1
        } else {
            imageCount = 0
        }
        imageView.image = image[imageCount]
    }
    
    
    
    @IBAction func imageTapAction(_ sender: UITapGestureRecognizer) {
        let nextView = storyboard?.instantiateViewController(withIdentifier: "nextView") as! NextViewController
        nextView.catchImage = imageView.image!
        pauseTimer()
        present(nextView, animated: true, completion: nil)
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    
}

//
//  NextViewController.swift
//  slideShowApp
//
//  Created by 勝良祥吾 on 2018/02/03.
//  Copyright © 2018年 shougo.katsura. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var catchImage: UIImage = #imageLiteral(resourceName: "image1")

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = catchImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

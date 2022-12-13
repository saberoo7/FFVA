//
//  ViewController.swift
//  FFVA
//
//  Created by Otakhon Toshpulatov on 13/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIImageView!
    
    @IBAction func Button(_ sender: UIButton) {
    
    let arra = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5"), #imageLiteral(resourceName: "ball2") ]
    circle.image =  arra.randomElement()
    }

}


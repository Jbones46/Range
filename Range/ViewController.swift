//
//  ViewController.swift
//  Range
//
//  Created by Justin Ferre on 10/20/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImg2: UILabel!
    @IBOutlet weak var cardImg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    
    @IBAction func imgTouched(sender: AnyObject) {
        
        let img1 = Card.init(Int(arc4random() % 52))
      cardImg.text = img1.description
        
        let img2 = Card.init(Int(arc4random() % 52))
        cardImg2.text = img2.description
        
        if img1.rawValue == img2.rawValue {
            print("even")

        
        }else {
           if img1.rawValue > img2.rawValue {
             cardImg.text = img2.description
            cardImg2.text = img1.description
            print("\((img1.rawValue - img2.rawValue) - 1)")
                
           }else {
            if img1.rawValue < img2.rawValue{
                cardImg.text = img1.description
                cardImg2.text = img2.description
                print("\((img2.rawValue - img1.rawValue) - 1)")

                }
            }
        }
    }


}


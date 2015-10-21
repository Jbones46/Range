//
//  ViewController.swift
//  Range
//
//  Created by Justin Ferre on 10/20/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
var answer = ""
    var count = 5
    var time = NSTimer()
    var randomArr: [String] = []
    @IBOutlet weak var btnLbl4: UIButton!
    @IBOutlet weak var counterLbl: UILabel!
    @IBOutlet weak var btnLbl3: UIButton!
    @IBOutlet weak var btnLbl2: UIButton!
    @IBOutlet weak var btnLbl1: UIButton!
    @IBOutlet weak var cardImg2: UILabel!
    @IBOutlet weak var cardImg: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func timer() {
     time = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countDown", userInfo: nil, repeats: true)
        
        
        
    
    }
    func countDown() {
        count -= 1
        counterLbl.text = String(count)
        if count <= 0 {
            time.invalidate()
            resultLbl.text = "Time's Up"
            
                btnLbl1.hidden = true
                btnLbl2.hidden = true
                btnLbl3.hidden = true
                btnLbl4.hidden = true
            
        }
        
    }
    
    
 
    
    @IBAction func imgTouched(sender: AnyObject) {
        btnLbl1.hidden = false
        btnLbl2.hidden = false
        btnLbl3.hidden = false
        btnLbl4.hidden = false
        count = 5
        counterLbl.text = String(count)
        time.invalidate()
        timer()
        
        
        let img1 = Card.init(Int(arc4random() % 52))
      cardImg.text = img1.description
        
        let img2 = Card.init(Int(arc4random() % 52))
        cardImg2.text = img2.description
        
        if img1.rawValue == img2.rawValue {
             answer = ("!!!")

        
        }else {
           if img1.rawValue > img2.rawValue {
             cardImg.text = img2.description
            cardImg2.text = img1.description
             answer = ("\((img1.rawValue - img2.rawValue) - 1)")
                
           }else {
            if img1.rawValue < img2.rawValue{
                cardImg.text = img1.description
                cardImg2.text = img2.description
                answer = ("\((img2.rawValue - img1.rawValue) - 1)")

                }
            }
            for _ in 1...4 {
                let n = String(arc4random() % 50)
                randomArr.append(n)
            }
            print(answer)
            print(randomArr)
            randomArr = []
        }
      let answerBtn = Int(arc4random() % 4)
        if answerBtn == btnLbl1.tag {
            btnLbl1.setTitle(answer, forState: .Normal)
             btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            if btnLbl2.titleLabel == answerBtn || btnLbl2 == btnLbl3 || btnLbl2 == btnLbl4{
                 btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            }
             btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            if btnLbl3.titleLabel == answerBtn || btnLbl3 == btnLbl2 || btnLbl3 == btnLbl4 {
                btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            }

             btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            if btnLbl4.titleLabel == answerBtn || btnLbl4 == btnLbl2 || btnLbl4 == btnLbl3 {
                btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
            }

            
        }else {
           
            if answerBtn == btnLbl2.tag {
                btnLbl2.setTitle(answer, forState: .Normal)
                 btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                if btnLbl1.titleLabel == answerBtn || btnLbl1 == btnLbl3 || btnLbl1 == btnLbl4 {
                    btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                }

                 btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                if btnLbl3.titleLabel == answerBtn || btnLbl3 == btnLbl1 || btnLbl3 == btnLbl4 {
                    btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                }

                 btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                if btnLbl4.titleLabel == answerBtn || btnLbl4 == btnLbl1 || btnLbl4 == btnLbl3 {
                    btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                }


            }else {
                if answerBtn == btnLbl3.tag {
                    btnLbl3.setTitle(answer, forState: .Normal)
                     btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    if btnLbl1.titleLabel == answerBtn || btnLbl1 == btnLbl2 || btnLbl1 == btnLbl4 {
                        btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    }

                     btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    if btnLbl2.titleLabel == answerBtn || btnLbl2 == btnLbl1 || btnLbl2 == btnLbl4 {
                        btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    }

                     btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    if btnLbl4.titleLabel == answerBtn || btnLbl4 == btnLbl1 || btnLbl4 == btnLbl2 {
                        btnLbl4.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                    }

                }else{
                    if answerBtn == btnLbl4.tag {
                        btnLbl4.setTitle(answer, forState: .Normal)
                         btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        if btnLbl1.titleLabel == answerBtn || btnLbl1 == btnLbl2 || btnLbl1 == btnLbl3 {
                            btnLbl1.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        }

                         btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        if btnLbl2.titleLabel == answerBtn || btnLbl2 == btnLbl1 || btnLbl2 == btnLbl3 {
                            btnLbl2.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        }

                         btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        if btnLbl3.titleLabel == answerBtn || btnLbl3 == btnLbl1 || btnLbl3 == btnLbl2 {
                            btnLbl3.setTitle(String(String(arc4random() % 50)), forState: .Normal)
                        }

                    }
                }
            }
        }
        resultLbl.text = ""
    
        
    }
    
    @IBAction func answerBtn(sender: UIButton) {
        time.invalidate()
        print("time left: \(count)")
        if sender.titleLabel?.text! == answer {
            resultLbl.text = "Correct 😀"
            
        }else {
            resultLbl.text = "Wrong 😡"
        }
    }


}


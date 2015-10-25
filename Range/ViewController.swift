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
    var bet = 10
    var coins = 200
var answer = ""
    var timeLeft = 0
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
    @IBOutlet weak var playBtnLbl: UIButton!
    @IBOutlet weak var coinsLbl: UILabel!
    @IBOutlet weak var resultLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coinsLbl.text = String(coins)

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
            playBtnLbl.userInteractionEnabled = true
            coins = coins - bet
            coinsLbl.text = String(coins)

            
                btnLbl1.hidden = true
                btnLbl2.hidden = true
                btnLbl3.hidden = true
                btnLbl4.hidden = true
            
        }
        
    }
    
    var rand = randomNumber()
    var randomA = getRandomArray()
    
    @IBAction func imgTouched(sender: UIButton) {
        btnLbl1.hidden = false
        btnLbl2.hidden = false
        btnLbl3.hidden = false
        btnLbl4.hidden = false
        count = 5 + timeLeft
        playBtnLbl.userInteractionEnabled = false
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
        
        _ = randomNumber()
        let randomA = getRandomArray()
        var randomG = setRandomArray(Int(answer)!, rand: randomA)
        if answerBtn == btnLbl1.tag {
            btnLbl1.setTitle(answer, forState: .Normal)
             btnLbl2.setTitle(String(randomG[0]), forState: .Normal)
           
             btnLbl3.setTitle(String(randomG[1]), forState: .Normal)
           

             btnLbl4.setTitle(String(randomG[2]), forState: .Normal)
           

            
        }else {
           
            if answerBtn == btnLbl2.tag {
                btnLbl2.setTitle(answer, forState: .Normal)
                 btnLbl1.setTitle(String(randomG[0]), forState: .Normal)
                

                 btnLbl3.setTitle(String(randomG[1]), forState: .Normal)
               

                 btnLbl4.setTitle(String(randomG[2]), forState: .Normal)
                


            }else {
                if answerBtn == btnLbl3.tag {
                    btnLbl3.setTitle(answer, forState: .Normal)
                     btnLbl1.setTitle(String(randomG[0]), forState: .Normal)
                   

                     btnLbl2.setTitle(String(randomG[1]), forState: .Normal)
                   

                     btnLbl4.setTitle(String(randomG[2]), forState: .Normal)
                   

                }else{
                    if answerBtn == btnLbl4.tag {
                        btnLbl4.setTitle(answer, forState: .Normal)
                         btnLbl1.setTitle(String(randomG[0]), forState: .Normal)
                       
                         btnLbl2.setTitle(String(randomG[1]), forState: .Normal)
                       

                         btnLbl3.setTitle(String(randomG[2]), forState: .Normal)
                        

                    }
                }
            }
        }
        resultLbl.text = ""
    
        
    }
    
    @IBAction func answerBtn(sender: UIButton) {
        
        time.invalidate()
        btnLbl1.hidden = true
        btnLbl2.hidden = true
        btnLbl3.hidden = true
        btnLbl4.hidden = true
        print("time left: \(count)")
        if sender.titleLabel?.text! == answer {
            resultLbl.text = "Correct 😀"
            timeLeft = count
            coins = coins + (bet * timeLeft)
             playBtnLbl.userInteractionEnabled = true
            coinsLbl.text = String(coins)
            
            
        }else {
            resultLbl.text = "Wrong 😡"
            timeLeft = 0
            coins = coins - bet
            playBtnLbl.userInteractionEnabled = true
            coinsLbl.text = String(coins)

        }
    }


}


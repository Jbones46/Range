//
//  randomDecider.swift
//  Range
//
//  Created by Justin Ferre on 10/25/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//

import Foundation
import UIKit


let SHADOW_COLOR: CGFloat = 157.0/255.0

var randArray: [Int] = []

func randomNumber() -> Int {
    let rand = Int(arc4random() % 50)
    
    return rand
    
}

func getRandomArray() -> [Int] {
    
    
    
    
    var numArray: [Int] = []
    for _ in 1...3 {
        repeat {numArray.append(randomNumber()) } while numArray.contains(randomNumber()) == false
        
        
    }
    
    return numArray
}

var test = getRandomArray()


func setRandomArray(answer: Int, rand: [Int]) -> [Int] {
    var randA = rand
    _ = answer
    
    if randA.contains(answer) {
        randA.removeAtIndex(randA.indexOf(answer)!)
    }
    
    return randA
    
}

let test2 = setRandomArray(44, rand: test)
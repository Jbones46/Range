//: Playground - noun: a place where people can play

import UIKit

var randArray: [Int] = []

func randomNumber() -> Int {
    let rand = Int(arc4random() % 50)
    
    return rand
    
}

func getRandomArray() -> [Int] {
    
    
   

    var numArray: [Int] = []
    for a in 1...3 {
    repeat {numArray.append(randomNumber()) } while numArray.contains(randomNumber()) == false
    
    
    }
    
    return numArray
}

var test = getRandomArray()


func setRandomArray(answer: Int, rand: [Int]) -> [Int] {
    var randA = rand
    var ans = answer
    
    if randA.contains(answer) {
        randA.removeAtIndex(randA.indexOf(answer)!)
    }
    
    return randA
    
}

let test2 = setRandomArray(44, rand: test)
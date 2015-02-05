//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Ben Blanchard on 29/01/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffNumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
        
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else {
                println("Tiger: Purr Purr")
            }
        }
    }
    
    
    func ageInTigerYearsFromAge (regularAge:Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "Tiger is big"
        }
        else if randomNumber == 1{
            randomFact = "TIgers can reach 3metres"
        }
        else {
            randomFact = "A group of tigers is called an ambush or a streak"
        }
        
        return randomFact
    }
    
    
    
    
    
}
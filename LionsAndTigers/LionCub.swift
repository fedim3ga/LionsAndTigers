//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Ben Blanchard on 05/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation
import UIKit

class LionCub : Lion {
    
    func rubLionCubsBelly() {
        println("LionCub: Snuggle and be happy")
    }
    
    override func roar() {
        super.roar()
        println("LionCub: Growl Growl")
    }
    
    override func randomFact() -> String {
        var randomFactString:String
        if self.isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for six weeks."
        }
        else {
            randomFactString = "Cubs start eating meat at 6 weeks old!"
        }
        return randomFactString
        }
    
}
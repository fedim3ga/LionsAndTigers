//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Ben Blanchard on 29/01/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// For structs, can access functions with self, can't access properties
// For classes, can access both functions and properties of self.
// Self helps us avoid name conflicts etc
// Self is relative
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    var myTigers:[Tiger] = []
    var myLions:[Lion] = []
    var myLionCubs:[LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger", index: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var myTiger = Tiger()
        myTiger.name = "Ben"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(1, isLoud: false )
        
        myTigers.append(myTiger)
        
        println("My tigers name is \(myTiger.name). Its age is \(myTiger.age). Its breed is \(myTiger.breed) and its image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image 
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.factLabel.text = myTiger.randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Jodie"
        secondTiger.breed = "IndoChinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        secondTiger.chuff()
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Alexis"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Mesut"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffNumberOfTimes(1)
        
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named:"Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named:"Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbarry"
        
        lion.roar()
        lioness.roar()
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
        
        self.myLions += [lion, lioness]
        
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named:"LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named:"LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.myLionCubs += [lionCub, femaleLionCub]
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()
        
    }
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
        
    func updateView () {
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve,animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.factLabel.text = tiger.randomFact()
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.myLions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.factLabel.text = lion.randomFact()
            }
            else if self.currentAnimal.species == "LionCub" {
                let lionCub = self.myLionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
                self.factLabel.text = lionCub.randomFact()
            }
            
            self.factLabel.hidden = false

                    
            }, completion: {
                (finished: Bool) ->  () in
            })
        
    }
    
}


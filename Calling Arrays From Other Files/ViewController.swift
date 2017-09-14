//
//  ViewController.swift
//  Calling Arrays From Other Files
//
//  Created by Hana on 9/26/16.
//  Copyright © 2016 sarcrates. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BurgerLabel: UILabel!
    
    @IBOutlet weak var BurgerGeneratedLabel: UILabel!

    @IBOutlet weak var ChipsLabel: UILabel!
    
    @IBOutlet weak var ChipsGeneratedLabel: UILabel!
    
    @IBOutlet weak var DrinkLabel: UILabel!
    
    @IBOutlet weak var DrinkGeneratedLabel: UILabel!
    

    
    @objc var copyBurgerOptions : NSArray = NSArray()
    @objc var copyChipOptions : NSArray = NSArray()
    @objc var copyDrinkOptions : NSArray = NSArray()
    
    @objc var burgerpicked : Int = 0
    @objc var chippicked : Int = 0
    @objc var drinkpicked : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BurgerGeneratedLabel.text = "Burger to be generated."
        ChipsGeneratedLabel.text = "Chips to be generated."
        DrinkGeneratedLabel.text = "Drink to be generated."
        var copiedBurgerOptions: BurgerOptions = BurgerOptions()
        var copiedChipOptions: ChipOptions = ChipOptions()
        var copiedDrinkOptions: DrinkOptions = DrinkOptions()
        copyBurgerOptions = copiedBurgerOptions.burgeroptions
        copyChipOptions = copiedChipOptions.chipoptions
        copyDrinkOptions = copiedDrinkOptions.drinkoptions
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            pickABurger()
            pickChips()
            pickDrink()
        }
    }

   // @IBAction func GeneratedMealAction(_ sender: UIButton) {
    //    pickABurger()
    //    pickChips()
    //    pickDrink()

  //  }
    
    @IBAction func ResetAction(_ sender: UIButton) {
        BurgerGeneratedLabel.text = "Burger to be generated."
        ChipsGeneratedLabel.text = "Chips to be generated."
        DrinkGeneratedLabel.text = "Drink to be generated."
    }
    
    

    @objc func pickABurger(){
        burgerpicked = Int(arc4random_uniform(UInt32(copyBurgerOptions.count)))
        BurgerGeneratedLabel.text = "\(copyBurgerOptions[burgerpicked])"
    }
    
    @objc func pickChips(){
        chippicked = Int(arc4random_uniform(UInt32(copyChipOptions.count)))
        ChipsGeneratedLabel.text = "\(copyChipOptions[chippicked])"
    }
    @objc func pickDrink(){
        drinkpicked = Int(arc4random_uniform(UInt32(copyDrinkOptions.count)))
        DrinkGeneratedLabel.text = "\(copyDrinkOptions[drinkpicked])"
    }
    
}


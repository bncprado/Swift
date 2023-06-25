//
//  ViewController.swift
//  Shamaz
//
//  Created by Bruno Nogueira Carvalho Prado on 18/06/2019.
//  Copyright © 2019 brunoNCprado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var promptMessage: UILabel!
    @IBOutlet weak var nextPlayerButton: UIButton!
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var futureButton: UIButton!
    
    //areas to store the sentences for past and future actions
    
    let past = ["What did you do last night?", "What did you do last weekend?", "Where were you living two years ago?", "What's your big regret?", "What's you're really proud off?"]
    
    let future = ["What's your plan for the next weekend?", "What's your plan for the next year?", "What's your next goal professionally wise?", "What's your plan for the next holidays?"]
    
    
    override func viewDidLoad() {
        selectRandomPlayer1st()
        enableDisableButtons(nextButtonEnabled: false)
    }
    
    //function call on pastButtonPress
    
    @IBAction func pastAction() {
        promptMessage.isHidden = false
        enableDisableButtons(nextButtonEnabled: true)
        let pastRandomIndex = Int (arc4random_uniform(UInt32(past.count)))
        let randomPast = past[pastRandomIndex]
        let pastTask = randomPast
        promptMessage.text = pastTask
        
    }
    
    //function call on futureButtonPress
    
    
    @IBAction func futureAction() {
        promptMessage.isHidden = false
        enableDisableButtons(nextButtonEnabled: true)
        let futureRandomIndex = Int (arc4random_uniform(UInt32(future.count)))
        let randomFuture = future[futureRandomIndex]
        let futureTask = randomFuture
        promptMessage.text = futureTask
    }
    
    // function call to select next player
    
    @IBAction func nextStoryteller() {
        promptMessage.isHidden = false
        enableDisableButtons(nextButtonEnabled: false)
        selectRandomPlayer()
    }
    
    func selectRandomPlayer () {
        let randomPlayer = Int.random(in: 1...10)
        let message = "Player \(randomPlayer). It's your turn"
        promptMessage.text = message
    }
    
    func selectRandomPlayer1st () {
        let randomPlayer = Int.random(in: 1...10)
        let message = "Hello. The first player is number \(randomPlayer). Choose \"Past\" or \"Future\""
        promptMessage.text = message
    }
    
    // function call for enable and disabling buttons
    
    func enableDisableButtons (nextButtonEnabled: Bool) {
        nextPlayerButton.isEnabled = nextButtonEnabled
        pastButton.isEnabled = !nextButtonEnabled
        futureButton.isEnabled = !nextButtonEnabled
    }
    
}

//
//  ViewController.swift
//  BullsEye
//
//  Created by Ionut Dita on 21/02/2019.
//  Copyright © 2019 Ionut Dita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue : Int = 0
    var targetValue : Int = 0
    var valueScore : Int = 0
    var randomNumber : Int = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomNumberView: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var hitMeButton: UIButton!
    @IBOutlet weak var roundNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        
        updateLabels()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackImageResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackImageResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        let title : String
        
        if difference == 0 {
            points += 100
            title = "Bull's Eye!! \nBonus +100 points!"
        } else if difference < 5 {
            points += 50
            title = "You almost had it! \nBonus +50 points!"
        } else if difference < 10 {
            title = "You need to practice more! \nBonus +25 points!"
            points += 25
        } else {
            title = "You are miles away!"
        }
        
        let message = "You've got \(points)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Try again", style: .default
            , handler: {
                action in
                self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        //startNewRound()
       // updateLabels()

    }
    

    @IBAction func sliderMoved(_ slider: UISlider) {
    
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    
    }
    
    func startNewRound(){
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        round += 1
        roundNumber.text = String(round)
        randomNumberView.text = String(targetValue)
        totalScore.text = String(score)
        
        if score > 500 {
            
            print("The game has ended!")
            hitMeButton.isHidden = true
        }
       
        
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        round = 0
        score = 0
        startNewRound()
        hitMeButton.isHidden = false
    }
    
}


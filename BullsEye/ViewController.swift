//
//  ViewController.swift
//  BullsEye
//
//  Created by Mario Zarate Velasquez on 2/11/20.
//  Copyright © 2020 Mario Zarate Velasquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    var targetValue: Int = 0
    var currentValue: Int = 50
    var scoreValue: Int = 0
    var roundValue: Int = 0
    
    //MARK: - Outlets
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLabelSetup()
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        
    }

    //MARK: - Actions
    
    @IBAction func hitMeAction(_ sender: UIButton) {
        self.roundValue += 1
        let difference = abs(self.targetValue - self.currentValue)
        let points = 100 - difference
        self.scoreValue += points
        
        // Alert
        let alert = UIAlertController(title: "Knock, Knock", message: "The value of the slider is now \(self.currentValue)\nThe target value is: \(self.targetValue)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOverAction(_ sender: UIButton) {
        initialLabelSetup()
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        self.currentValue = Int(slider.value.rounded())
    }
    
    //MARK: - Methods
    
    func startNewRound() {
        self.slider.setValue(50.0, animated: true)
        self.currentValue = Int(self.slider.value.rounded())
        self.targetValue = Int.random(in: 1...100)
        self.targetLabel.text = "\(self.targetValue)"
        self.scoreLabel.text = "\(self.scoreValue)"
        self.roundLabel.text = "\(self.roundValue)"
    }
    
    func initialLabelSetup() {
        self.scoreValue = 0
        self.scoreLabel.text = "0"
        self.roundValue = 0
        self.roundLabel.text = "0"
    }
}


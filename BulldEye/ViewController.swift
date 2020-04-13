//
//  ViewController.swift
//  BulldEye
//
//  Created by ZELIMKHAN MAGAMADOV on 09.03.2020.
//  Copyright © 2020 ZELIMKHAN MAGAMADOV. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue: Int!
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighLighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighLighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let leftTrackResizeble = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(leftTrackResizeble, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let rightTrackResizeble = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(rightTrackResizeble, for: .normal)
        
        startOver()
        
        
        
    }
    
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        
        var points = 100 - difference
        
        let title: String!
        
        switch difference {
        case 0:
            title = "Превосходно!"
            points += 100            
        case 1:
            title = "Очень близко!"
            points += 50
        case ..<5:
            title = "Близко!"
            points += 25
        case ..<10:
            title = "Неплохо..."
            points += 10
        default:
            title = "Даже не близко!"
        }
        
        score += points
        
        let message = "You scored: \(points) points"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok",
                                   style: .default) { (action) in
                                    self.startNewRound()
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
        addAnimation()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
        
        // addAnimation()
        
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func addAnimation() {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    
    
    
    @IBAction func didTapTest(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}




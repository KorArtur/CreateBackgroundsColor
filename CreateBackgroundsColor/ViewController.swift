//
//  ViewController.swift
//  CreateBackgroundsColor
//
//  Created by Карина Короткая on 02.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var backgraundColorView: UIView!
    
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgraundColorView.layer.cornerRadius = 10
        setColor()
        setValueToLabels(sliders: [redSlider, greenSlider, blueSlider])
        
    }
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        setValueToLabels(sliders: [sender])
    }
    
    private func setColor() {
        backgraundColorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func getText(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValueToLabels(sliders: [UISlider]) {
        
        for slider in sliders {
            switch slider.tag {
            case 1:
                redValueLabel.text = getText(from: slider)
            case 2:
                greenValueLabel.text = getText(from: slider)
            default:
                blueValueLabel.text = getText(from: slider)
            }
        }
    }
}


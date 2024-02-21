//
//  SettingsViewController.swift
//  CreateBackgroundsColor
//
//  Created by Карина Короткая on 02.02.2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet private var backgraundColorView: UIView!
    
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    var viewColor: UIColor!
    weak var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgraundColorView.layer.cornerRadius = 10
        
        configureSliders()
        setColor()
        setValueToLabels(sliders: [redSlider, greenSlider, blueSlider])
    }
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        setValueToLabels(sliders: [sender])
    }
    
    @IBAction private func DoneButtonTapped() {
        delegate?.changeColor(backgraundColorView.backgroundColor)
        dismiss(animated: true)
    }
    
    private func configureSliders() {
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
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



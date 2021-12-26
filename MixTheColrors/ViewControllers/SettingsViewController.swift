//
//  SettingsViewController.swift
//  MixTheColrors
//
//  Created by Дмитрий Шульгин on 24.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorSpace: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var settingsDelegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        colorSpace.layer.cornerRadius = 20
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorSpace.layer.borderColor = UIColor.darkGray.cgColor
        colorSpace.layer.borderWidth = 2.5
        
        
        //setColor()
        colorSpace.backgroundColor = settingsDelegate.mainScreenColor
        //let colors = colorSpace.backgroundColor?.cgColor.components
        //let countcolors = colors?.capacity
        
        let ciColor = CIColor(color: colorSpace.backgroundColor ?? UIColor.white)
        let red = ciColor.red
        let green = ciColor.green
        let blue = ciColor.blue
        redSlider.value = Float(red * 255)
        greenSlider.value = Float(green  * 255)
        blueSlider.value = Float(blue  * 255)
        setValue(for: redLabel, greenLabel, blueLabel)
    }
    


    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()

        switch sender {
        case redSlider: setValue(for: redLabel)
        case greenSlider: setValue(for: greenLabel)
        default: setValue(for: blueLabel)
        }

        
    }
    
    private func setColor() {
        colorSpace.backgroundColor = UIColor(
            red: CGFloat(redSlider.value.CGFloat),
            green: CGFloat(greenSlider.value.CGFloat),
            blue: CGFloat(blueSlider.value.CGFloat),
            alpha: 1
        )
    }

    

    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
            case greenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.f", slider.value)
    }
    
    private func getCGColors(_ color: UIColor){
        
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        settingsDelegate.setBackgroundColor(colorSpace.backgroundColor)
        dismiss(animated: true)
    }
    

}

extension Float{
    var CGFloat: Float {
        self / 255
    }
}



//
//  ViewController.swift
//  MixTheColrors
//
//  Created by Дмитрий Шульгин on 11.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var colorSpace: UILabel!
    
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //redSlider.minimumTrackTintColor = UIColor.red
        //greenSlider.minimumTrackTintColor = .green
        //blueSlider.minimumTrackTintColor = .blue
        /*выдает ошибку извлечения, так и не понял в чем проблема,
         на первый взгялд так же как в примере с урока
         
         - Unexpectedly found nil while implicitly unwrapping an Optional value
         */
        
        setColor()
        colorSpace.layer.cornerRadius = 10
        colorSpace.layer.masksToBounds = true
        colorSpace.layer.isOpaque = true
        
        colorSpace.layer.borderColor = UIColor.darkGray.cgColor
        colorSpace.layer.borderWidth = 2.5
        


    }
    

    
@IBAction func redSliderAction(_ sender: UISlider) {
    
    red = CGFloat(sender.value / Float(255.0))
    redValue.text = sender.value.roundedAndString
    setColor()
}

@IBAction func greenSliderAction(_ sender: UISlider) {
    
    green = CGFloat(sender.value / Float(255.0))
    greenValue.text = sender.value.roundedAndString
    setColor()
}

    

@IBAction func blueSliderAction(_ sender: UISlider) {
        blue = CGFloat(sender.value / Float(255.0))
        blueValue.text = sender.value.roundedAndString
        setColor()
}

    func setColor(){
        colorSpace.backgroundColor = UIColor.init(red: red , green: green , blue: blue, alpha: alpha)
    }

    func floatTostring(_ value: Float) -> String{
        return String(Int(round(value)))
    }
    

}

extension Float{
    var roundedAndString: String {return String(format: "%.0f", self.rounded()) }
}

//
//  ViewController.swift
//  MixTheColrors
//
//  Created by Дмитрий Шульгин on 11.12.2021.
//

import UIKit


protocol SettingsViewControllerDelegate {
    var mainScreenColor: UIColor! {get}
    func setBackgroundColor(_ color: UIColor?)
}

class ColorViewController: UIViewController {
   
    
    
    override func viewDidLoad() {

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let settingsVC = navigationVC.topViewController as? SettingsViewController else { return }
        settingsVC.settingsDelegate = self
    }

}

extension ColorViewController: SettingsViewControllerDelegate{
    var mainScreenColor: UIColor! {
        self.view.backgroundColor
    }
    
    
    
    func setBackgroundColor(_ color: UIColor?) {
        self.view.backgroundColor = color
        //view.backgroundColor = UIColor.red
    }
}

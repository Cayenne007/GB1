//
//  OptionsViewController.swift
//  GB1
//
//  Created by Cayenne on 26.11.2022.
//

import UIKit


class OptionsViewController: UIViewController {
    
    @IBOutlet weak var randomOrderSwitch: UISwitch!
    
    
    //MARK: - Private properties
    
    
    
    //MARK: - Life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomOrderSwitch.isOn = Game.shared.randomOrder
        
    }
    
    @IBAction func randomOrderSwitchValueChanged(_ sender: UISwitch) {
        Game.shared.randomOrder = sender.isOn
        Game.shared.saveSettings()
    }
    
    
}

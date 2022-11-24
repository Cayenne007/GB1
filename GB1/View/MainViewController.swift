//
//  MainViewController.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? GameViewController else {
            return
        }
        
        destination.delegate = Game.shared.session
        
    }
    
}

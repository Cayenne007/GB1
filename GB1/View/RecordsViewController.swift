//
//  RecordsViewController.swift
//  GB1
//
//  Created by Cayenne on 24.11.2022.
//

import UIKit

class RecordsViewController: UIViewController {

    @IBOutlet weak var recordsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func recordsOnClick(_ sender: Any) {
        Game.shared.removeRecords()        
        recordsTableView.reloadData()
    }
    
    

}

extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.score.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let score = Game.shared.score[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "record", for: indexPath)
        var content = cell.defaultContentConfiguration()

        // Configure content.
        content.image = UIImage(systemName: "star")
        content.text = "Игра \(score.number)"
        content.secondaryText = "\(score.sum)"

        // Customize appearance.
        content.imageProperties.tintColor = .purple

        cell.contentConfiguration = content
        
        return cell	
    }
    
    
}


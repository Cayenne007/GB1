//
//  ViewController.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    
    var questionsCount: Int {get}
    var title: String {get}
    var text: String {get}
    var answers: [String] {get}
    var costTitle: String {get}
    var moneyTitle: String {get}
    
    func confirm(tag: Int) -> GameResult
    
}

class GameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var answerTableView: UITableView!
    
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    
    var delegate: GameViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerTableView.register(UINib(nibName: answerCellName(), bundle: nil), forCellReuseIdentifier: answerCellName())
        answerTableView.backgroundColor = .black
        
        configure()
        
    }
    

    func configure() {
        textLabel.text = delegate.text
        titleLabel.text = delegate.title
        costLabel.text = delegate.costTitle
        moneyLabel.text = delegate.moneyTitle
        answerTableView.reloadData()
    }

}

extension GameViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate.answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answer = delegate.answers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: answerCellName(), for: indexPath) as! AnswerTableViewCell
        cell.configureButton(with: answer) { [weak self] in
            guard let self = self else {
                return
            }
            let result = self.delegate.confirm(tag: indexPath.row)
            
            switch result {
            case .correctAnswer:
                self.configure()
            case .gameOver:                
                self.dismiss(animated: true)
            }
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
}

fileprivate func answerCellName() -> String {
    String(describing: AnswerTableViewCell.self)
}

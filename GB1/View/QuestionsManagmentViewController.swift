//
//  QuestionsManagmentViewController.swift
//  GB1
//
//  Created by Cayenne on 28.11.2022.
//

import UIKit


protocol QuestionsManagmentViewControllerDelegate {
    var source: Question {get}
}

class QuestionsManagmentViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    private var questions = QuestionStore.shared.get()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? QuestionEditViewController else {
            return
        }
        
        if let tag = (sender as? UITableViewCell)?.tag {
            destination.question = questions[tag]
        }
        destination.updateTable = {
            self.questions = QuestionStore.shared.get()
            self.tableView.reloadData()
        }
        
    }

}

extension QuestionsManagmentViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let question = questions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()

        // Configure content.
        content.text = "\(indexPath.row + 1). \(question.text)"
        content.secondaryText = "Ответ: \(question.answers[question.correctAnswer])"

        cell.contentConfiguration = content
        cell.tag = indexPath.row
        
        return cell
    }
    
    
    
}

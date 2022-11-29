//
//  QuestionEditViewController.swift
//  GB1
//
//  Created by Cayenne on 28.11.2022.
//

import UIKit

class QuestionEditViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    
    @IBOutlet weak var answer1TextField: UITextField!
    
    @IBOutlet weak var answer2TextField: UITextField!
    
    @IBOutlet weak var answer3TextField: UITextField!
    
    @IBOutlet weak var answer4TextField: UITextField!
    
    @IBOutlet weak var correctNaswerSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var questionCost: UITextField!
    
    
    //MARK: Properties
    
    var question: Question?
    var updateTable: (()->())!

    
    //MARK: - Life circle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextView.text = question?.text
        
        let array = [answer1TextField, answer2TextField, answer3TextField, answer4TextField]
        let answers = question?.answers ?? []
        array.forEach{
            let tag = $0?.tag ?? 0
            if answers.count > tag {
                $0?.text = answers[tag]
            }
        }
        
        correctNaswerSegmentedControl.tag = question?.correctAnswer ?? 0
        questionCost.text = "\(question?.cost ?? 0)"
        
    }
    
    
    //MARK: Actions
    
    @IBAction func saveQuestion(_ sender: Any) {
        
        let title = titleTextView.text ?? ""
        let answers =
        [answer1TextField, answer2TextField, answer3TextField, answer4TextField]
            .compactMap{
                if let text = $0?.text {
                    return text
                } else {
                    return nil
                }
            }
        let correctAnswer = correctNaswerSegmentedControl.selectedSegmentIndex
        let cost = Int(questionCost.text ?? "0") ?? 0
                   
        let question = Question(text: title,
                                answers: answers,
                                correctAnswer: correctAnswer,
                                cost: cost)
        QuestionStore.shared.add(question)
        updateTable()
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func trashButtonOnClick(_ sender: Any) {
        
        if let text = titleTextView.text {
            QuestionStore.shared.del(title: text)
            updateTable()
            navigationController?.popViewController(animated: true)
        }
    }
    
    

}

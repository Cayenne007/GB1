//
//  AnswerTableViewCell.swift
//  GB1
//
//  Created by Cayenne on 23.11.2022.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var answerButton: UIButton!
    
    var buttonTapBlock: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        answerButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureButton(with title: String, _ closure: @escaping ()->()) {
        answerButton.setTitle(title, for: .normal)
        buttonTapBlock = closure
    }
    
    @IBAction func AnswerButtonPressed(_ sender: Any) {
        buttonTapBlock?()
    }
    
    
    
}

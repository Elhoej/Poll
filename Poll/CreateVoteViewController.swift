//
//  CreateVoteViewController.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

protocol CreateVoteViewControllerDelegate: class
{
    func didCreateNewVote(withVote vote: Vote)
}

class CreateVoteViewController: UIViewController, VotePresenter
{
    var voteController: VoteController?
    weak var delegate: CreateVoteViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var voteButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        voteButton.isEnabled = false
        voteButton.setTitleColor(.lightGray, for: .normal)
    }
    @IBAction func handleEditingChanged(_ sender: Any)
    {
        guard let name = nameTextField.text, let answer = answerTextField.text else { return }
        let isValid = name.count > 0 && answer.count > 0
        
        voteButton.isEnabled = isValid ? true : false
        voteButton.setTitleColor(isValid ? .blue : .lightGray, for: .normal)
    }
    
    @IBAction func createVote(_ sender: Any)
    {
        self.view.endEditing(true)
        guard let name = nameTextField.text, let answer = answerTextField.text else { return }
        let vote = voteController?.createVote(with: name, answer: answer, date: Date())
       
        nameTextField.text = nil
        answerTextField.text = nil
        
        voteButton.isEnabled = false
        voteButton.setTitleColor(.lightGray, for: .normal)
        
        if let vote = vote
        {
            showAlert(vote: vote)
        }
    }
    
    private func showAlert(vote: Vote)
    {
        let alert = UIAlertController(title: "Your vote has been cast.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (_) in
            
            self.delegate?.didCreateNewVote(withVote: vote)
        }))
        present(alert, animated: true, completion: nil)
    }
}















//
//  CombinedViewController.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class CombinedViewController: UIViewController, CreateVoteViewControllerDelegate, VotePresenter
{
    func didCreateNewVote(withVote vote: Vote)
    {
//        votesTableViewController.tableView.reloadData()
        guard let index = voteController?.votes.index(of: vote) else { return }
        let indexPath = IndexPath(item: index, section: 0)
        votesTableViewController.tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    var createVoteViewController: CreateVoteViewController!
    var votesTableViewController: VotesTableViewController!
    var voteController: VoteController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let tableViewController = segue.destination as? VotesTableViewController
        {
            votesTableViewController = tableViewController
            votesTableViewController.voteController = voteController
        }
        
        if let createController = segue.destination as? CreateVoteViewController
        {
            createVoteViewController = createController
            createController.delegate = self
            createController.voteController = voteController
        }
    }
    
    
}

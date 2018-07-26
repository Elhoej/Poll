//
//  VotesTableViewController.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit



class VotesTableViewController: UITableViewController, VotePresenter
{
    var voteController: VoteController?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }



    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return voteController?.votes.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "voteCell", for: indexPath) as! VoteCell
        
        let vote = voteController?.votes[indexPath.row]
 
        cell.nameLabel.text = vote?.name
        cell.answerLabel.text = vote?.answer
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        if let timestamp = vote?.timestamp
        {
            let timestampString = dateFormatter.string(from: timestamp)
            cell.dateLabel.text = timestampString
        }

        return cell
    }
 
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//
//    }
}

















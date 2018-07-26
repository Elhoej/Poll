//
//  VoteController.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import Foundation

class VoteController
{
    private(set) var votes = [Vote]()
    
    func createVote(with name: String, answer: String, date: Date) -> Vote
    {
        let vote = Vote(name: name, answer: answer, timestamp: Date())
        votes.append(vote)
        return vote
    }

    
}

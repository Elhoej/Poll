//
//  Answer.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import Foundation

struct Vote: Equatable
{
    var name: String
    var answer: String
    var timestamp: Date
}

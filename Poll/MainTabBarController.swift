//
//  MainTabBarController.swift
//  Poll
//
//  Created by Simon Elhoej Steinmejer on 26/07/18.
//  Copyright © 2018 Simon Elhoej Steinmejer. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let voteController = VoteController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for childViewController in childViewControllers
        {
            if let vc = childViewController as? VotePresenter
            {
                vc.voteController = voteController
            }
        }
    }


}

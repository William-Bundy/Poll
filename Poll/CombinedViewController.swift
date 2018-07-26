//
//  CombinedViewController.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class VoteHierarchyViewController: UIViewController, VoteModelConsumer {
	var voteController: VoteController!
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		if let vmc = segue.destination as? VoteModelConsumer {
			vmc.voteController = voteController
		}
	}
}

class CombinedVoteView: VoteHierarchyViewController,  VoteControllerDelegate {

	var voteForm:VoteView!
	var resultForm:ResultsView!

    override func viewDidLoad() {
        super.viewDidLoad()

		print("Combined loaded!")
        // Do any additional setup after loading the view.
    }

	func onVoteAdded(_ vote: Vote) {
		if resultForm != nil {
			resultForm.tableView.reloadData()
		}
	}


}

//
//  CombinedViewController.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class VoteHierarchyView: UIViewController, VoteModelConsumer
{
	var voteController: VoteController!

	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		super.prepare(for: segue, sender: sender)
		if let vmc = segue.destination as? VoteModelConsumer {
			vmc.voteController = voteController
		}
	}
}

class CombinedVoteView: VoteHierarchyView,  VoteControllerDelegate
{
	var resultForm:ResultsView!

    override func viewDidLoad() {
        super.viewDidLoad()

		print("Combined")
		print(voteController)
		if voteController != nil {
			voteController.delegate = self
		}
    }
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		super.prepare(for: segue, sender: sender)
		if let res = segue.destination as? ResultsView {
			resultForm = res
		}
	}
		

	func onVoteAdded(_ vote: Vote) {
		if resultForm != nil {
			resultForm.tableView.reloadData()
		}
	}


}

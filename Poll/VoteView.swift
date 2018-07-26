//
//  VoteView.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class VoteView: VoteHierarchyViewController
{
	override func viewDidLoad() {
		super.viewDidLoad()
		print("Vote view loaded!")
	}

	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var responseField: UITextField!
	@IBAction func submitVote(_ sender: Any) {
		guard voteController != nil ,
			let result = responseField.text, result != "",
			let name = nameField.text, name != ""
		else {return}
		let _ = voteController.create(name, result)
	}
}

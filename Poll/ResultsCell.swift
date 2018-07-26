//
//  ResultsCell.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell
{
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var responseLabel: UILabel!

	var voteTime:String = ""
	var vote:Vote! {
		didSet {
			nameLabel?.text = vote.name
			responseLabel?.text = vote.response
			timeLabel?.text = voteTime
		}
	}

}

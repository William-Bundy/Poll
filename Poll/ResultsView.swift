//
//  ResultsView.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class ResultsView: VoteHierarchyViewController, UITableViewDataSource, UITableViewDelegate
{
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		print("Results loaded!")
		if let table = tableView {
			table.dataSource = self
			table.delegate = self
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		if tableView != nil {
			tableView.reloadData()
		}
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return voteController?.votes.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
		let v = voteController.votes[indexPath.row]
		cell.textLabel!.text = "\(v.name): \(v.response)"
		return cell
	}

}

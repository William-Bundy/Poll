//
//  ResultsView.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class ResultsView: VoteHierarchyView, UITableViewDataSource, UITableViewDelegate
{
	var dater = DateFormatter()
	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// not sure if these are set by default
		dater.timeZone = TimeZone.current
		dater.locale = NSLocale.current

		dater.dateFormat = "HH:mm"

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
		let defaultCell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath)
		guard let cell = defaultCell as? ResultsCell else {return defaultCell}

		let v = voteController.votes[indexPath.row]
		cell.voteTime = "\(dater.string(from:v.timestamp))"
		cell.vote = v
		return cell
	}

}

//
//  VoteModel.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import Foundation

struct Vote: Equatable, Comparable
{
	var name:String
	var response:String
	var timestamp:Date

	static func <(lhs:Vote, rhs:Vote) -> Bool
	{
		return lhs.timestamp < rhs.timestamp
	}
}

protocol VoteControllerDelegate: class
{
	func onVoteAdded(_ vote:Vote)
}

protocol VoteModelConsumer: class
{
	var voteController:VoteController! {get set}
}

class VoteController
{
	weak var delegate:VoteControllerDelegate!

	var votes:[Vote] = []

	func organizeVotes() {
		votes.sort()
	}

	func add(_ vote:Vote) {
		// this is less than perfect
		// we could keep it sorted by inserting with a binary search
		// but meh
		votes.append(vote)
		organizeVotes()
		if delegate != nil {
			delegate.onVoteAdded(vote)
		}
	}

	func create(_ name:String, _ response:String) -> Vote
	{
		let v = Vote(name:name, response:response, timestamp:Date(timeIntervalSinceNow: 0))
		add(v)
		return v
	}
}

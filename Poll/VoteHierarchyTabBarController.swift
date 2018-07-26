//
//  VoteHierarchyTabBarController.swift
//  Poll
//
//  Created by William Bundy on 7/26/18.
//  Copyright © 2018 William Bundy. All rights reserved.
//

import UIKit

class VoteHierarchyTabBarController: UITabBarController
{
    override func viewDidLoad()
	{
        super.viewDidLoad()

		print("Tab bar loaded!")
        // Do any additional setup after loading the view.
		for child in self.childViewControllers {
			if let child = child as? VoteHierarchyViewController {
				child.voteController = AppGlobal.voteController
			}
		}
    }
}

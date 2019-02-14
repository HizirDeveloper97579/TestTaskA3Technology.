//
//  UsersTableViewCell.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
	
	var user: User? {
		didSet{
			self.textLabel?.text = user?.name
		}
	}
}


//
//  Extension + UITableViewCell.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

extension UIView {
	
	//идентификатор для ячеек (tableViewCell/collectionViewCell)
	static var identifire: String {
		get{
			return String(describing: self)
		}
	}
	
	func addShadowAndRoundedCorners() {
		layer.shadowColor   = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
		layer.cornerRadius  = 10
		layer.shadowOpacity = 1
		layer.shadowOffset  = CGSize.zero
		layer.shadowRadius  = 3
	}
	
}

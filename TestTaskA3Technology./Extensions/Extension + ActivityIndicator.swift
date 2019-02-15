//
//  Extension + ActivityIndicator.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
	//работа активити индикатора
	func show(on: Bool){
		isHidden = !on
		if !on {
			stopAnimating()
		} else {
			startAnimating()
		}
	}
}

//
//  Proxyble.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

protocol Proxyble {
	
	func loadImage(urlString: String? , complition: @escaping Clousure<UIImage> )
	
}

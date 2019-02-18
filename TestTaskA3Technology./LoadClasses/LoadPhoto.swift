//
//  PhotoLoadManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class LoadPhoto: Session {
	
	func loadData(urlString: String?, complition: @escaping Clousure<Any>){
		session(urlString: urlString) {(data) in
			guard let image = UIImage(data: data) else { return }
			complition(image)
		}
		
	}
}

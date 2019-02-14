//
//  CacheManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class CacheManager {
	
	static let shared = CacheManager()
	private init(){}
	
	let cache = NSCache<NSString, UIImage>()
	
	func saveData(stringKey: String?, image: UIImage){
		guard let key = stringKey as NSString? else { return }
		cache.setObject(image, forKey: key)
	}
	
	func getData(stringKey: String?) -> UIImage? {
		guard let key = stringKey as NSString? else { return nil }
		if let image = cache.object(forKey: key) {
			return image
		} else {
			return nil
		}
	}
}



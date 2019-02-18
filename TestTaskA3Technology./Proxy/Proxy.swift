//
//  ProxyManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class Proxy: Session {
	
	let loadObject: Session!
	
	let cache: CacheManager<UIImage>!
	
	func loadData(urlString: String?, complition: @escaping Clousure<Any>) {

		if let getImage = cache?.get(stringKey: urlString) {
			DispatchQueue.main.async {
				complition(getImage)
			}
		} else {
		loadObject.loadData(urlString: urlString) { [unowned self] (loadData) in
			if self.cache != nil {
			self.cache.save(stringKey: urlString, cacheObj: loadData as! UIImage)
			}
			DispatchQueue.main.async {
				complition(loadData)
			}
		}
		}
	}
	
	init(loadObject: Session, cache: CacheManager<UIImage>? = nil) {
		self.loadObject = loadObject
	  self.cache = cache
	}
}

//
//  CacheManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class CacheManager<T: NSObject>{
	
	let cache = NSCache<NSString, T>()
	
	func save(stringKey: String?, cacheObj: T){
		guard let key = stringKey as NSString? else { return }
		cache.setObject(cacheObj, forKey: key)
	}
	
	func get(stringKey: String?) -> T? {
		guard let key = stringKey as NSString? else { return nil }
		if let cacheObj = cache.object(forKey: key) {
			return cacheObj
		} else {
			return nil
		}
	}
	init(){
		
	}
}



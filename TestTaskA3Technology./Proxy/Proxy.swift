//
//  ProxyManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class Proxy: Proxyble {
	
	let loadObject: Proxyble!
	let cache: CacheManager<UIImage>!
	
	func loadImage(urlString: String?, complition: @escaping Clousure<UIImage>) {
		if let getImage = cache.get(stringKey: urlString) {
			DispatchQueue.main.async {
				complition(getImage)
			}
		} else {
		loadObject.loadImage(urlString: urlString) { (loadIimage) in
			DispatchQueue.main.async {
				complition(loadIimage)
			}
		}
		}
	}
	
	init(loadObject: Proxyble, cache: CacheManager<UIImage>) {
		self.loadObject = loadObject
		self.cache = cache
	}
}

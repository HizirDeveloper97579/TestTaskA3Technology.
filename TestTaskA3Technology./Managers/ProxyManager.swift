//
//  ProxyManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class ProxyManager {
	
	static let shared = ProxyManager()
	private init(){}
	
	func proxy(url: String?, comlition: @escaping Clousure<UIImage>){
		if let imageGet = CacheManager.shared.get(stringKey: url) {
			DispatchQueue.main.async {
				comlition(imageGet)
			}
		} else {
		
		PhotoLoadManager.shared.loadPhotoURL(url: url) {(image) in
			CacheManager.shared.save(stringKey: url, image: image)
			DispatchQueue.main.async {
			comlition(image)
			}
		 }
		}
	}
}


//
//  ParseJSONPhoto.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class ParseJSONPhotos: JSONParseble {
	
	typealias SelfReturn = [Photo]
	
	func parseJSON(url: String, id: Double?, complition: @escaping Clousure<Decodable>) {
		parse(urlString: url) {(data) in
			do{
				let getPhotos = try JSONDecoder().decode([Photo].self, from: data).filter({ $0.albumId == id})
				DispatchQueue.main.async {
					complition(getPhotos)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
}

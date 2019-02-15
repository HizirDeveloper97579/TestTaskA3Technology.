//
//  ParseJSONPhoto.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class ParseJSONPhotos: JSONParseble {
	
	func parseJSON(url: String, complition: @escaping Clousure<Decodable>) {
		parse(urlString: url) {(data) in
			do{
				let getPhotos = try JSONDecoder().decode([Photo].self, from: data)
				DispatchQueue.main.async {
					complition(getPhotos)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
}

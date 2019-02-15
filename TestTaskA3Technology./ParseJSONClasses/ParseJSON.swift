//
//  ParseJSON.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class ParseJSON: JSONParseble {
	
	var delegate: JSONParseble!
	
	func parseJSON(url: String, complition: @escaping Clousure<Decodable>){
		delegate.parseJSON(url: url) { (json) in
			complition(json)
		}
	}
	
	init(parseJSON: JSONParseble) {
		self.delegate = parseJSON
	}
}

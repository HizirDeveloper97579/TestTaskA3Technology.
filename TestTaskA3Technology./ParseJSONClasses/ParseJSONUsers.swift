//
//  ParseJSONUsers.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class ParseJSONUsers: JSONParseble {
	
	
	func parseJSON(url: String, complition: @escaping Clousure<Decodable>) {
		parse(urlString: url) {(data) in
			do{
				let getUsers = try JSONDecoder().decode([User].self, from: data)
				DispatchQueue.main.async {
					complition(getUsers)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
}

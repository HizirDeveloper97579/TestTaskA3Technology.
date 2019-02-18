//
//  ParseJSON.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class LoadJSON<T: Decodable>: Session {
	
	func loadData(urlString: String?, complition: @escaping Clousure<Any> ) {
		
		guard let url = urlString else { return }
		session(urlString: url) {(data) in
			do{
				let getUsers = try JSONDecoder().decode([T].self, from: data)
				DispatchQueue.main.async {
					complition(getUsers)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
}

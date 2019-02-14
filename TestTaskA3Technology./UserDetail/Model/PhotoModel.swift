//
//  PhotoModel.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import Foundation
//модель Photo для JSON
struct Photo: Decodable {
	
	var albumId     : Double?
	var id		      : Double?
	var title       : String?
	var url         : String?
	var thumbnailUrl: String?
}

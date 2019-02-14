//
//  Typealias.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import Foundation

typealias ClousureProxy = (Data, URLResponse, Error) -> Void
typealias Clousure<T>   = (T) -> Void

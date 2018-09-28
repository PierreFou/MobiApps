//
//  Weather.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

//
//  WeatherReport.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation

struct WeatherReport: Decodable {
    var cod: String
    var cnt: Int
    var list: [WeatherList]
    
}

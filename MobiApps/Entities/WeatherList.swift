//
//  WeatherList.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation

struct WeatherList: Decodable {
    var dt: Double
    var weather: [Weather]
    var main: Main
}

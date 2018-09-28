//
//  WeatherListViewModel.swift
//  MobiApps
//
//  Created by Fournier Pierre on 13/09/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import Foundation

final class WeatherListViewModel {
    
    var weatherList: [WeatherList]!
    
    init(withWeatherList weatherList: [WeatherList]? = [WeatherList]()) {
        self.weatherList = weatherList
    }
}

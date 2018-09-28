//
//  WeatherService.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    static let shared = WeatherService()
    
    var weatherList = [WeatherList]()
    var weatherIconsURL = [String]()
    
    func setWeatherList(_ newWeatherList: [WeatherList]) {
        weatherList = newWeatherList
    }
    
    func getWeather(completion: @escaping CompletionHandler) {
        
        Alamofire.request(Constants.Url.ApiCompleteUrlWeather).responseJSON { (response) in
            if response.response?.statusCode != 200 {
                completion(false)
            } else if let data = response.data {
                do {
                    let cachedURLResponse = CachedURLResponse(response: response.response!, data: data, userInfo: nil, storagePolicy: .allowed)
                    URLCache.shared.storeCachedResponse(cachedURLResponse, for: response.request!)
                    self.weatherList = try JSONDecoder().decode(WeatherReport.self, from: data).list
                    
                    completion(true)
                
                } catch {
                    completion(false)
                }
            }
        }
    }
    
    func getIconURL(iconId: String) -> URL {
        return URL(string: "\(Constants.Url.ApiCompleteUrlWeatherIcons)\(iconId).png")!
    }
}

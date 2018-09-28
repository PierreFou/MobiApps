//
//  WeatherService.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

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
    
    func getWeatherPromise() -> Promise<[WeatherList]> {
        let url = URL(string: Constants.Url.ApiCompleteUrlWeather)!
        
        return firstly {
          URLSession.shared.dataTask(.promise, with: url)
        }.compactMap {
            return try JSONDecoder().decode(WeatherReport.self, from: $0.data).list
        }
    }
    
    func getIconURL(iconId: String) -> URL {
        return URL(string: "\(Constants.Url.ApiCompleteUrlWeatherIcons)\(iconId).png")!
    }
}

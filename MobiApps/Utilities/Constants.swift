//
//  Constants.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> Void

struct Constants {
    
    struct Url {
        
        // API constants
        static let ApiUrl = "http://api.openweathermap.org/"
        static let ApiWeatherURL = "data/2.5/forecast?id="
        static let ApiIdParis = "6455259"
        static let ApiKey = "APPID=b8477dcdf6c1fea5ed2874d2d8c6610d"
        static let ApiUrlWeatherIcons = "img/w/"
        static let ApiDegresInCelcius = "units=metric"
        
        static let ApiCompleteUrlWeather = "\(ApiUrl)\(ApiWeatherURL)\(ApiIdParis)&\(ApiKey)&\(ApiDegresInCelcius)"
        static let ApiCompleteUrlWeatherIcons = "\(ApiUrl)\(ApiUrlWeatherIcons)"
        
    }
    
    struct Libelle {
        
        // Messages
        static let Meteo = "Météo"
        static let NoInternetTitle = "Aucune connectivité"
        static let NoInternetMessage = "Veuiller activer votre connexion internet et réessayer"
        
        static let Error = "Erreur"
        static let ErrorMessage = "Un problème est survenu, veuillez réessayer plus tard ou vérifier les mises à jour"
        
        static let TemperatureMax = "Température max : "
        static let TemperatureMin = "Température min : "
        
        static let Ok = "Ok"
    }
    
    struct Date {
        static let DateFormat = "HH'h', EEEE dd MMMM"
        static let HourDateFormat = "HH' heures'"
        static let SimpleDateFormat = "EEEE dd MMMM"
    }
    
    struct Image {
        static let Placeholder = "placeholder"
    }
    
    struct Identifier {
        static let StoryboardName = "Main"
        static let SegueDetail = "detail"
        static let ViewControllerDetail = "DetailViewController"
    }
    
}

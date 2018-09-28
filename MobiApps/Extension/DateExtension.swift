//
//  DateExtension.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import Foundation

extension Double {
    
    // L'objet double devra correspondre au timeIntervalSince1970
    func getDate(withFormat format: String) -> String {
        return formatDate(withFormat: format).capitalized
    }
    
    // L'objet double devra correspondre au timeIntervalSince1970
    func getHour() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.Date.HourDateFormat
        dateFormatter.locale = Locale(identifier: "FR-fr")
        return dateFormatter.string(from: date)
    }
    
    private func formatDate(withFormat format: String) -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "FR-fr")
        return dateFormatter.string(from: date)
    }

}

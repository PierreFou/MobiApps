//
//  DetailViewController.swift
//  MobiApps
//
//  Created by Pierre on 27/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var weatherToDisplay: WeatherList?

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initComponents()
    }

    @IBAction func shareClicked() {
        if let weather = weatherToDisplay, !weather.weather.isEmpty {
            
            let activityVC = UIActivityViewController(activityItems: [weather.weather[0].description], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            present(activityVC, animated: true, completion: nil)
        }
    }
    
    // Initialise les IBOutlets
    func initComponents() {
        if let weather = weatherToDisplay, !weather.weather.isEmpty {
            
            dateLabel.text = weather.dt.getHour()
            temperatureMaxLabel.text = "\(Constants.Libelle.TemperatureMax)\(Int(weather.main.temp_max))°"
            temperatureMinLabel.text = "\(Constants.Libelle.TemperatureMin)\(Int(weather.main.temp_min))°"
            weatherTypeLabel.text = weather.weather[0].description
            
            iconImageView.sd_setImage(with: WeatherService.shared.getIconURL(iconId: weather.weather[0].icon), placeholderImage: UIImage(named: Constants.Image.Placeholder), options: [], completed: nil)
        }
    }
    
}

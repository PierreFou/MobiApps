//
//  WeatherListViewController.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import PromiseKit

final class WeatherListViewController: UIViewController {

    @IBOutlet weak var weatherListTableView: UITableView!
    
    fileprivate var viewModel: WeatherListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = WeatherListViewModel()
        
        weatherListTableView.register(WeatherTableViewCell.nib, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        
        loadWeather2()
    }

}

fileprivate extension WeatherListViewController {
    func loadWeather() {
        
        if let network = NetworkReachabilityManager(), network.isReachable {
            WeatherService.shared.getWeather { (success) in
                if !success {
                    self.displayAlert(title: Constants.Libelle.Error, message: Constants.Libelle.ErrorMessage, button: Constants.Libelle.Ok)
                } else {
                    self.weatherListTableView.reloadData()
                }
            }
        } else if let url = URL(string: Constants.Url.ApiCompleteUrlWeather), let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            do {
                let weatherList = try JSONDecoder().decode(WeatherReport.self, from: cachedResponse.data).list
                WeatherService.shared.setWeatherList(weatherList)
            } catch {
                displayAlert(title: Constants.Libelle.Error, message: Constants.Libelle.ErrorMessage, button: Constants.Libelle.Ok)
            }
        }
    }
    
    func loadWeather2() {
        WeatherService.shared.getWeatherPromise().done { weatherList in
            self.viewModel = WeatherListViewModel(withWeatherList: weatherList)
            self.weatherListTableView.reloadData()
        }.catch { error in
            self.displayAlert(message: error.localizedDescription)
        }
    }
}

extension WeatherListViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.weatherList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell {
                
                let weather = viewModel.weatherList[indexPath.row]
                
                // Put the formatted date in the title
                cell.titleLabel?.text = weather.dt.getDate(withFormat: Constants.Date.DateFormat)
                
                if !weather.weather.isEmpty {
                    // Put the temperature in the subtitle
                    cell.subTitleLabel?.text = "\(Int(weather.main.temp))°, \(weather.weather[0].description)"
                    cell.imageView?.sd_setImage(with: WeatherService.shared.getIconURL(iconId: weather.weather[0].icon),
                                                placeholderImage: UIImage(named: Constants.Image.Placeholder),
                                                options: [], completed: nil)
                }
                
                return cell
            }
            
            return UITableViewCell()
        }
        
    }
    
extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // On passe sur la vue détail
        let storyBoard = UIStoryboard(name: Constants.Identifier.StoryboardName, bundle: nil)
        if let detailVC = storyBoard.instantiateViewController(withIdentifier: Constants.Identifier.ViewControllerDetail) as? DetailViewController {
            let selectedWeather = viewModel.weatherList[indexPath.row]
            
            detailVC.navigationItem.title = selectedWeather.dt.getDate(withFormat: Constants.Date.SimpleDateFormat)
            detailVC.weatherToDisplay = selectedWeather
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

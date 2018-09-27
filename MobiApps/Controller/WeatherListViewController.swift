//
//  WeatherListViewController.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        WeatherService.shared.getWeather()
        
    }

}

extension WeatherListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension WeatherListViewController: UITableViewDelegate {
    
}

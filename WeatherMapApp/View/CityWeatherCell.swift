//
//  CityWeatherCell.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class CityWeatherCell: UITableViewCell {
    
    var viewModel: CityWeatherCell.ViewModel? {
        didSet {
            didSetViewModel()
        }
    }

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var maximumLabel: UILabel!
    
    private func didSetViewModel() {
        cityLabel.text = viewModel?.cityName
        weatherLabel.text = viewModel?.weather
        minimumLabel.text = viewModel?.minimumTemperature
        maximumLabel.text = viewModel?.maximumTemperature
    }
    
}

extension CityWeatherCell {
    
    struct ViewModel {
        var cityName: String?
        var weather: String?
        var minimumTemperature: String?
        var maximumTemperature: String?
        
        init(city: City) {
            cityName = city.name
            weather = city.weather?.first?.description
            minimumTemperature = city.main?.minimumTemperature == nil ? "" : "Min: \(city.main!.minimumTemperature!)"
            maximumTemperature = city.main?.maximumTemperature == nil ? "" : "Max: \(city.main!.maximumTemperature!)"
        }
    }
    
}

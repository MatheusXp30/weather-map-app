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
    @IBOutlet weak var temperatureLabel: UILabel!
    
    private func didSetViewModel() {
        cityLabel.text = viewModel?.cityName
        weatherLabel.text = viewModel?.weather
        minimumLabel.text = viewModel?.minimumTemperature
        maximumLabel.text = viewModel?.maximumTemperature
        temperatureLabel.text = viewModel?.temperature
    }
    
    override func prepareForReuse() {
        weatherIconImageView.image = UIImage(named: "no_image")
    }
    
    // TODO
    func convertToCelcius(fahrenheit: Float) -> Float {
        return ( fahrenheit - 32 ) / 1.8
    }
    
    static func convertToCelcius(kelvin: Float) -> Float {
        return kelvin - 273.15
    }
    
    static func floatToString(number: Float, decimals: Int) -> String {
        return String(format: "%.\(decimals)f", number)
    }
    
}

extension CityWeatherCell {
    
    struct ViewModel {
        var cityName: String?
        var weather: String?
        var minimumTemperature: String?
        var maximumTemperature: String?
        var temperature: String?
        
        init(city: City) { // TODO
            
            cityName = city.name
            weather = city.weather?.first?.description
            minimumTemperature = city.main?.minimumTemperature == nil ? "" : "Min: \(CityWeatherCell.floatToString(number: convertToCelcius(kelvin: city.main!.minimumTemperature!), decimals: 1))"
            maximumTemperature = city.main?.maximumTemperature == nil ? "" : "Max: \(CityWeatherCell.floatToString(number: convertToCelcius(kelvin: city.main!.maximumTemperature!), decimals: 1))"
            temperature = city.main?.temperature == nil ? "" : "\(CityWeatherCell.floatToString(number: convertToCelcius(kelvin: city.main!.temperature!), decimals: 1))"
        }
    }
    
}

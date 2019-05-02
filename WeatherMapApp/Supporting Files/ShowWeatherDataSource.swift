//
//  ShowWeatherDataSource.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

protocol ShowWeatherDataSourceDelegate: class {
    func successCitiesInCycle(response: [City])
    func failureCitiesInCycle(_ error: Error)
}

protocol ShowWeatherDataSourceProtocol {
    var delegate: ShowWeatherDataSourceDelegate? { get set }
    func getCitiesInCycle(latitude: Float, longitude: Float, numberOfResults: Int)
}

class ShowWeatherDataSource: ShowWeatherDataSourceProtocol {
    weak var delegate: ShowWeatherDataSourceDelegate?
    
    let apiManager = OpenWeatherApiManager.shared
    
    func getCitiesInCycle(latitude: Float, longitude: Float, numberOfResults: Int) {
        apiManager.getCitiesInCycle(
            latitude: latitude,
            longitude: longitude,
            numberOfReturns: numberOfResults
        ) { [unowned self] (cities, error) in
            guard error == nil else {
                self.delegate?.failureCitiesInCycle(error!)
                return
            }
            
            guard let cities = cities else {
                return
            }
            
            self.delegate?.successCitiesInCycle(response: cities)
        }
    }
    
}

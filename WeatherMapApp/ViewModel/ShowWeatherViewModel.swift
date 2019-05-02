//
//  ShowWeatherViewModel.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

protocol ShowWeatherViewModelDelegate: class {
    func successCitiesInCycle(response: [City])
    func failureCitiesInCycle(_ error: Error)
}

class ShowWeatherViewModel {
    
    weak var delegate: ShowWeatherViewModelDelegate?
    private var dataSource: ShowWeatherDataSourceProtocol
    
    init(dataSource: ShowWeatherDataSourceProtocol) {
        self.dataSource = dataSource
        self.dataSource.delegate = self
    }
    
    func requestData() {
        // TODO
        dataSource.getCitiesInCycle(latitude: -3.1, longitude: -60, numberOfResults: 20)
    }
    
}

extension ShowWeatherViewModel: ShowWeatherDataSourceDelegate {
    func successCitiesInCycle(response: [City]) {
        delegate?.successCitiesInCycle(response: response)
    }
    
    func failureCitiesInCycle(_ error: Error) {
        delegate?.failureCitiesInCycle(error)
    }
    
}

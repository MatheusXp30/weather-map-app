//
//  CitiesList.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 01/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

struct CitiesList: Decodable {
    let message: String?
    let code: String?
    let count: Int?
    let cities: [City]?
    
    enum CodingKeys: String, CodingKey {
        case message
        case code = "cod"
        case count
        case cities = "list"
    }
}

struct City: Decodable {
    let id: Int?
    let name: String?
    let coordinate: Coordinate?
    let main: CityMainInformations?
    let weather: [Weather]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coordinate = "coord"
        case main
        case weather
    }
}

struct CityMainInformations: Decodable {
    let temperature: Float?
    let pressure: Float?
    let humidity: Int?
    let minimumTemperature: Float?
    let maximumTemperature: Float?
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case pressure
        case humidity
        case minimumTemperature = "temp_min"
        case maximumTemperature = "temp_max"
    }
}

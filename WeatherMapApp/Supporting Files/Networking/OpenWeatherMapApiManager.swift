//
//  OpenWeatherMapApiManager.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 01/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Moya

class OpenWeatherApiManager {
    
    static let shared = OpenWeatherApiManager()
    
    private init() {}
    
    private let provider = MoyaProvider<OpenWeatherApi>()
    
    func getCitiesInCycleList(
        latitude: Float,
        longitude: Float,
        numberOfReturns: Int,
        completion: @escaping (CitiesList?, Error?) -> Void
    ) {
        provider.request(.getCitiesInCycle(
            latitude: latitude,
            longitude: longitude,
            numberOfReturns: numberOfReturns
        )) { (response) in
            switch response {
            case .success(let value):
                do {
                    let citiesList: CitiesList = try JSONDecoder().decode(CitiesList.self, from: value.data)
                    completion(citiesList, nil)
                } catch {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
}

//
//  OpenWeatherMapApi.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 01/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Moya

enum OpenWeatherApi {
    case getCitiesInCycle(latitude: Float, longitude: Float, numberOfReturns: Int)
}

extension OpenWeatherApi: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .getCitiesInCycle:
            return "/find"
        }
    }
    
    var method: Method {
        switch self {
        case .getCitiesInCycle:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getCitiesInCycle(let latitude, let longitude, let numberOfReturns):
            var parameters: [String: Any] = [:]
            parameters["lat"] = latitude
            parameters["lon"] = longitude
            parameters["cnt"] = numberOfReturns
            parameters["appid"] = Constants.apiKey
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCitiesInCycle:
            return ["content-type": "application/json"]
        }
    }
}

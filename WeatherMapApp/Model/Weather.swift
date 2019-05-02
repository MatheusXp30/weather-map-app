//
//  Weather.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 01/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import Foundation

struct Weather: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

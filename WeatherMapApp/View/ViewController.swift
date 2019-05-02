//
//  ViewController.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 30/04/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiManager = OpenWeatherApiManager.shared
        
        apiManager.getCitiesInCycleList(latitude: -3.1, longitude: -60, numberOfReturns: 10) { (citiesList, error) in
            let cities = citiesList?.cities
            for city in cities! {
                print(city.name!)
            }
        }
        
    }


}


//
//  ViewController.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 30/04/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class ShowWeatherViewController: UIViewController {
    
    @IBOutlet weak var showWeatherView: UIView!
    
    let viewModel = ShowWeatherViewModel(dataSource: ShowWeatherDataSource())

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setViewModel() {
        viewModel.delegate = self
    }

    private func loadShowWeatherListView(cities: [City]) {
        showWeatherView.subviews.forEach({ $0.removeFromSuperview() })
        if let showWeatherListView = Bundle.main.loadNibNamed("ShowWeatherList", owner: self, options: nil)!.first as? ShowWeatherList {
            showWeatherListView.viewModel = ShowWeatherList.ViewModel(cities: cities)
            showWeatherListView.frame = showWeatherView.bounds
            showWeatherView.addSubview(showWeatherListView)
        }
    }

}

extension ShowWeatherViewController: ShowWeatherViewModelDelegate {
    func successCitiesInCycle(response: [City]) {
        
    }
    
    func failureCitiesInCycle(_ error: Error) {
        
    }
    
}

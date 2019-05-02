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
    
    // TODO Precisa disso?
    let viewModel = ShowWeatherViewModel(dataSource: ShowWeatherDataSource())
    weak var showWeatherListManager: ShowWeatherListProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewModel()
        viewModel.requestData()
    }
    
    private func setViewModel() {
        viewModel.delegate = self
    }

    private func loadShowWeatherListView(cities: [City]) {
        showWeatherView.subviews.forEach({ $0.removeFromSuperview() })
        if let showWeatherListView = Bundle.main.loadNibNamed("ShowWeatherList", owner: self, options: nil)!.first as? ShowWeatherList {
            showWeatherListManager = showWeatherListView
            showWeatherListView.viewModel = ShowWeatherList.ViewModel(cities: cities)
            showWeatherListView.frame = showWeatherView.bounds
            showWeatherView.addSubview(showWeatherListView)
            showWeatherListManager?.reloadTableViewData()
        }
    }

}

extension ShowWeatherViewController: ShowWeatherViewModelDelegate {
    func successCitiesInCycle(response: [City]) {
        loadShowWeatherListView(cities: response)
    }
    
    func failureCitiesInCycle(_ error: Error) {
        
    }
    
}

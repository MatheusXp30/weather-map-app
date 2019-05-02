//
//  ShowWeatherList.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

class ShowWeatherList: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ShowWeatherList.ViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTableView()
    }
    
    private func setTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CityWeatherCell", bundle: nil), forCellReuseIdentifier: "CityWeatherCell")
    }
}

extension ShowWeatherList: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cities.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell") as! CityWeatherCell
        
        let city = viewModel!.cities[indexPath.row]
        cell.viewModel = CityWeatherCell.ViewModel(city: city)
        
        return cell
    }
    
}

extension ShowWeatherList {
    
    struct ViewModel {
        var cities: [City]
    }
    
}

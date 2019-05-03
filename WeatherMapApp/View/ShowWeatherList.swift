//
//  ShowWeatherList.swift
//  WeatherMapApp
//
//  Created by Matheus Ribeiro on 02/05/19.
//  Copyright © 2019 Matheus Ribeiro. All rights reserved.
//

import UIKit

protocol ShowWeatherListDelegate: class {
    func weatherIconForRowAt(indexPath: IndexPath, weatherIcon: String)
}

protocol ShowWeatherListProtocol: class {
    var delegate: ShowWeatherListDelegate? { get set }
    func reloadTableViewData()
    func setWeatherIconForRowAt(indexPath: IndexPath, weatherIcon: UIImage)
}

class ShowWeatherList: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: ShowWeatherListDelegate?
    
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
        
        if let cityWeatherIcon = city.weather?.first?.icon {
            delegate?.weatherIconForRowAt(indexPath: indexPath, weatherIcon: cityWeatherIcon)
        }
        
        return cell
    }
    
}

extension ShowWeatherList: ShowWeatherListProtocol {
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
    
    func setWeatherIconForRowAt(indexPath: IndexPath, weatherIcon: UIImage) {
        
        guard let visibleRows = tableView.indexPathsForVisibleRows else {
            return
        }
        
        if visibleRows.contains(indexPath) {
            let cell = tableView.cellForRow(at: indexPath) as! CityWeatherCell
            cell.weatherIconImageView.image = weatherIcon
        }
    }
}

extension ShowWeatherList {
    
    struct ViewModel {
        var cities: [City]
    }
    
}

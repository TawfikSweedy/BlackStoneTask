//
//  WeatherHomeTableViewDelegates.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 01/10/2024.
//

import Foundation
import UIKit

// MARK: - TableView Delegate Datasource & Delegate 
extension WeatherHomeViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Model = citiesData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell" , for: indexPath) as! SearchTableViewCell
        cell.titleLabel.text = "\(Model.name ?? "") - \(Model.region ?? "")"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Model = citiesData[indexPath.row]
        searchTextField.text = Model.name
        citiesData.removeAll()
        citiesTableView.reloadData()
        presenter?.GetForeCastForCity(q: Model.name ?? "Cairo")
        UIView.transition(with: searchView, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            self.searchView.isHidden = true
        })
        citiesTableView.deselectRow(at: indexPath, animated: true)
    }
}

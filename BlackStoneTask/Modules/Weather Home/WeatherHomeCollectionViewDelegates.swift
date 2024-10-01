//
//  WeatherHomeCollectionViewDelegates.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 01/10/2024.
//

import Foundation
import UIKit


//MARK: - CollectionView Delegate Datasource & Delegate
extension WeatherHomeViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.ForeCastData?.forecast?.forecastday?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = presenter?.ForeCastData?.forecast?.forecastday?[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
        cell.configureData(data: model!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 120)
    }
}

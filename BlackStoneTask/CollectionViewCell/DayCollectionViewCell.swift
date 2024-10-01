//
//  DayCollectionViewCell.swift
//  BlackStoneTask
//
//  Created by  Tawfik Sweedy✌️ on 01/10/2024.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(data : Forecastday) {
        img.sd_setImage(with: URL(string: "https:\(data.day?.condition?.icon ?? "")") , completed: nil)
        tempLabel.text = "\(data.day?.avghumidity ?? 0.0)°/\(data.day?.mintemp_c ?? 0.0)°C - \(data.day?.maxtemp_c ?? 0.0)°C"
        dayLabel.text = data.date
    }

}

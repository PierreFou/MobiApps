//
//  WeatherTableViewCell.swift
//  MobiApps
//
//  Created by Pierre on 25/09/2018.
//  Copyright © 2018 Pierre. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Permet de réduire la taille si le libellé est trop grand
        titleLabel.adjustsFontSizeToFitWidth = true
        subTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    static var nib: UINib {
        let bundle = Bundle(for: WeatherListViewController.self)
        return UINib(nibName: identifier, bundle: bundle)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

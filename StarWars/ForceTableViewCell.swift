//
//  ForceTableViewCell.swift
//  StarWars
//
//  Created by Field Employee on 12/18/20.
//

import UIKit

class ForceTableViewCell: UITableViewCell {

    @IBOutlet weak var forceNameLabel: UILabel!
    @IBOutlet weak var forceEyeLabel: UILabel!
    
    @IBOutlet weak var forceHairLabel: UILabel!
    
    @IBOutlet weak var forceHomeLabel: UILabel!
    
    func configure(with force: Force) {
        self.forceNameLabel.text = force.name
        self.forceEyeLabel.text = force.eyeColor
        self.forceHairLabel.text = force.hairColor
        self.forceHomeLabel.text = force.homeWorld
    }
    
}

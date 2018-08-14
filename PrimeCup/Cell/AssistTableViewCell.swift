//
//  AssistTableViewCell.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/13/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class AssistTableViewCell: UITableViewCell {

    // Create outlets for cell
    
    func setAssist(player: Player) {
        self.textLabel?.text = player.name
        self.imageView?.image = player.playerImage
    }

}

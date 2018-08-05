//
//  Goal.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/4/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation

class Goal: NSObject {
    
    var scorer: Player
    var assist: Player
    
    init(scorer: Player, assist: Player) {
        self.scorer = scorer
        self.assist = assist
    }
}

//
//  PlayerModel.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/30/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    // Personal Info
    let name: String
    let dateOfBirth: String
    var age: Int
    let country: String
    var team: String
    let position: String
    
    // Player Stats
    private(set) var pace: Int = 0
    private(set) var drib: Int = 0
    private(set) var def: Int = 0
    private(set) var str: Int = 0
    private(set) var sho: Int = 0
    private(set) var pas: Int = 0
    
    init(name: String, dateOfBirth: String, age: Int, country: String, team: String, position: String) {
        self.name = name
        self.age = age
        self.dateOfBirth = dateOfBirth
        self.country = country
        self.team = team
        self.position = position
    }
    
    func updatePlayerStats(pace: Int, drib: Int, def: Int, str: Int, sho: Int, pas: Int) {
        self.pace = pace
        self.drib = drib
        self.def = def
        self.str = str
        self.sho = sho
        self.pas = pas
    }
    
}

//
//  PlayerViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/1/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit
import TKRadarChart

class PlayerViewController: UIViewController, TKRadarChartDataSource, TKRadarChartDelegate, UITableViewDelegate {
    
    var player: Player?

    @IBOutlet weak var oPlayerPictureImageView: UIImageView!
    @IBOutlet weak var oPlayerNameLabel: UILabel!
    @IBOutlet weak var oPlayerAverageStatsLabel: UILabel!
    @IBOutlet weak var oTopSectionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let player = player else { return }
        oPlayerPictureImageView.image = player.playerImage
        oPlayerPictureImageView.layer.cornerRadius = 64
        oPlayerPictureImageView.layer.masksToBounds = true
        oPlayerNameLabel.text = player.name + " : \(player.position)"
        oPlayerAverageStatsLabel.text = String(player.averageStats)
        
        let w = view.bounds.width
        let y = oTopSectionView.frame.maxY
        let chart = TKRadarChart(frame: CGRect(x: 0, y: 0, width: w, height: w))
        chart.configuration.radius = (w - 64) / 3
        chart.dataSource = self
        chart.delegate = self
        chart.center = CGPoint(x: view.center.x, y: y + (w / 3) + 16)
        chart.reloadData()
        view.addSubview(chart)
        
    }
    
    func numberOfStepForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 0
    }
    func numberOfRowForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 6
    }
    func numberOfSectionForRadarChart(_ radarChart: TKRadarChart) -> Int {
        return 2
    }
    
    func titleOfRowForRadarChart(_ radarChart: TKRadarChart, row: Int) -> String {
        var statLabels = ["Pace", "Shooting", "Passing", "Dribbling", "Defense", "Strength"]
        var gkStatLabels = ["Diving", "Handling", "Kicking", "Reflexes", "Speed", "Positioning"]
        var stats = [player!.pace, player!.sho, player!.pas, player!.drib, player!.def, player!.str]
        
        if player!.position == "GK" {
            return gkStatLabels[row] + ": \(stats[row])"
        } else {
            return statLabels[row] + ": \(stats[row])"
        }
    }
    
    func valueOfSectionForRadarChart(withRow row: Int, section: Int) -> CGFloat {

        var stats = [player!.pace, player!.sho, player!.pas, player!.drib, player!.def, player!.str]
        let stat = (Double(stats[row] - 25) / 75.0) * 5.0
        let statNoScale = Double(stats[row]) / 20.0
        return CGFloat(statNoScale)
    }
    
    
    func colorOfLineForRadarChart(_ radarChart: TKRadarChart) -> UIColor {
        return UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    }
    
    func colorOfFillStepForRadarChart(_ radarChart: TKRadarChart, step: Int) -> UIColor {
        switch step {
        case 1:
            return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        case 2:
            return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        case 3:
            return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        case 4:
            return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        default:
            return UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        }
    }
    
    func colorOfSectionFillForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red: 0.9, green: 0.0, blue: 0.0, alpha: 1.0)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha: 1.0)
        }
    }
    
    func colorOfSectionBorderForRadarChart(_ radarChart: TKRadarChart, section: Int) -> UIColor {
        if section == 0 {
            return UIColor(red:1,  green:0.867,  blue:0.012, alpha:1)
        } else {
            return UIColor(red:0,  green:0.788,  blue:0.543, alpha:1)
        }
    }
    
    func fontOfTitleForRadarChart(_ radarChart: TKRadarChart) -> UIFont {
        return UIFont.systemFont(ofSize: 12)
    }

}

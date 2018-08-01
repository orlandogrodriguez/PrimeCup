//
//  MatchHistoryViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 7/31/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class MatchHistoryViewController: UITableViewController {
    
    var databse: TeamPlayerDatabase {
        get {
            return (self.tabBarController!.viewControllers![0] as! StandingsViewController).database
        }
        set {
            (self.tabBarController!.viewControllers![0] as! StandingsViewController).database = newValue
        }
    }
    
    @IBOutlet weak var oMatchHistoryTableView: UITableView!
    var matches: [Match]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matches = self.databse.matches
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        self.tabBarController?.navigationItem.title = "Match History"
        oMatchHistoryTableView.tableFooterView = UIView()
        oMatchHistoryTableView.reloadData()
    }
}

extension MatchHistoryViewController: UINavigationBarDelegate, UITabBarDelegate {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = HistoryCell()
        if let matches = matches {
            cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as! HistoryCell
            cell.setMatch(match: matches[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let matches = matches else { return 0 }
        return matches.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 121.5
    }
}

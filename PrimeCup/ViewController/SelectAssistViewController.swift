//
//  SelectAssistViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/13/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class SelectAssistViewController: UIViewController {

    @IBOutlet weak var oAssistTableView: UITableView!
    var players: [Player]?
    var scorer: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oAssistTableView.delegate = self
        oAssistTableView.dataSource = self
    }
    
    @IBAction func handleNoAssist(_ sender: UIButton) {
        // TODO: Update this to handle no assist.
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "confirmGoalVC") as! ConfirmGoalViewController
        nextVC.assist = self.scorer
        nextVC.scorer = self.scorer
        self.navigationController?.pushViewController(nextVC, animated: true) as! ConfirmGoalViewController
    }
    
}

extension SelectAssistViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let players = players else { return 0 }
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.players != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AssistCell") as! AssistTableViewCell
            let assist = self.players![indexPath.row]
            cell.setAssist(player: assist)
            return cell
        } else {
            print("Error getting cell for scorer.")
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "confirmGoalVC") as! ConfirmGoalViewController
        nextVC.assist = players![indexPath.row]
        nextVC.scorer = self.scorer
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

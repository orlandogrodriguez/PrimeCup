//
//  ConfrimGoalViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/13/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class ConfirmGoalViewController: UIViewController {
    
    var scorer: Player?
    var assist: Player?
    var goal: Goal?
    
    @IBOutlet weak var oTeamNameLabel: UILabel!
    @IBOutlet weak var oScorerImageView: UIImageView!
    @IBOutlet weak var oScorerLabel: UILabel!
    @IBOutlet weak var oAssistImageView: UIImageView!
    @IBOutlet weak var oAssistLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        oScorerImageView.layer.cornerRadius = oScorerImageView.frame.width / 2
        oScorerImageView.clipsToBounds = true
        oAssistImageView.layer.cornerRadius = oAssistImageView.frame.width / 2
        oAssistImageView.clipsToBounds = true
        self.view.layoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oTeamNameLabel.text = scorer?.team
        oScorerImageView.image = scorer?.playerImage
        oScorerLabel.text = scorer?.name
        guard let assist = assist else { return }
        oAssistImageView.image = assist.playerImage
        oAssistLabel.text = assist.name
    }
    
    @IBAction func handleConfirmGoal(_ sender: UIButton) {
        if scorer != nil && assist != nil {
            self.goal = Goal(scorer: scorer!, assist: assist!)
        }
        goToSetScoreVC()
    }
    
    func goToSetScoreVC() {
        let vcCount = self.navigationController?.viewControllers.count
        let setScoreVC = self.navigationController?.viewControllers[vcCount! - 4] as! SetScoreViewController
        setScoreVC.addGoal(goal: goal!)
        self.navigationController?.popToViewController(setScoreVC, animated: true)
    }
    
}

//
//  AddGoalViewController.swift
//  PrimeCup
//
//  Created by Orlando G. Rodriguez on 8/4/18.
//  Copyright © 2018 Orlando G. Rodriguez. All rights reserved.
//

import UIKit

class AddGoalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var playerTeam: Team?
    var scorerPickerView: UIPickerView = UIPickerView()
    var assistPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var oScorerTextField: UITextField!
    @IBOutlet weak var oAssistTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        oScorerTextField.inputView = scorerPickerView
        oAssistTextField.inputView = assistPickerView
        scorerPickerView.delegate = self
        scorerPickerView.dataSource = self
        assistPickerView.delegate = self
        assistPickerView.dataSource = self
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let playerTeam = playerTeam else { return 0 }
        return playerTeam.teamMembers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let playerTeam = playerTeam else { return "" }
        
        return playerTeam.teamMembers[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let playerTeam = playerTeam else { return }
        if pickerView == self.scorerPickerView {
            oScorerTextField.text = playerTeam.teamMembers[row].name
        } else if pickerView == self.assistPickerView {
            oAssistTextField.text = playerTeam.teamMembers[row].name
        }
    }
    
    @IBAction func handleSubmitGoal(_ sender: Any) {
        var scorer: Player?
        for playerS in playerTeam!.teamMembers {
            if oScorerTextField.text == playerS.name {
                scorer = playerS
                scorer?.goals += 1
                break
            }
        }
        
        var assist: Player?
        for playerA in playerTeam!.teamMembers {
            if oAssistTextField.text == playerA.name {
                assist = playerA
                assist?.assists += 1
                break
            }
        }
        
        var goal: Goal?
        if scorer != nil && assist != nil {
            goal = Goal(scorer: scorer!, assist: assist!)
        }
        
        
        // Instantiate previous VC, and append goal to it.
        // let previousVC = self.storyboard?.instantiateViewController(withIdentifier: "setScoreVC") as! SetScoreViewController
        
        let vcCount = self.navigationController?.viewControllers.count
        let previousVC = self.navigationController?.viewControllers[vcCount! - 2] as! SetScoreViewController
        previousVC.addGoal(goal: goal!)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}

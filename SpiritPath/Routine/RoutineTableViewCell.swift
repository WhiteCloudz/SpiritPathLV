//
//  RoutineTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/6/23.
//

import UIKit
import CoreData


class RoutineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var routineName: UILabel!
    @IBOutlet weak var iconeButton: UIButton!
    @IBOutlet weak var routineGoal: UILabel!
    @IBOutlet weak var routineNow: UILabel!
    @IBOutlet weak var steckView: UIStackView!
    @IBOutlet weak var devider: UILabel!
    var updateButtonAction: (() -> Void)?
    var goToCounterButtonAction: (() -> Void)?
   
    let customFont = UIFont(name: "Hiragino Mincho ProN W6", size: 15.0)
    let numbers = Array(0...10000)
    var pickerData =  [Routine]()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        steckView.layer.cornerRadius = steckView.bounds.height / 5
        steckView.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
    }
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(_ routine: Routine, updateButtonAction: (() -> Void)?, routineAddButtonAction: (() -> Void)?, routineMinusButtonAction: (() -> Void)?) {
        routineName.text = routine.name
        routineGoal.text = routine.goal
        routineNow.text = routine.today
        self.updateButtonAction = updateButtonAction
        self.goToCounterButtonAction = routineAddButtonAction
    }
    
    
    @IBAction func goToCounterButtonTapped(_ sender: Any) {
        goToCounterButtonAction?()
    }
    
    @IBAction func LeftButtonTapped(_ sender: Any) {
        updateButtonAction?()
    }
    
}


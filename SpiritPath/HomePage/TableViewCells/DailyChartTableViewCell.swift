//
//  DailyChartTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 1/8/24.
//

import UIKit

class DailyChartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var zikirView: UIView!
    @IBOutlet weak var prayerView: UIView!
    @IBOutlet weak var readingView: UIView!
    @IBOutlet weak var zikirButton: UIButton!
    @IBOutlet weak var prayerButton: UIButton!
    @IBOutlet weak var readingButton: UIButton!
    
    
        var zikirButtonAction: (() -> Void)?
        var prayerButtonAction: (() -> Void)?
        var readingButtonAction: (() -> Void)?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            bringSubviewToFront(zikirButton)
            bringSubviewToFront(prayerButton)
            bringSubviewToFront(readingButton)
            
            self.selectionStyle = .none
            stackView.layer.cornerRadius = stackView.bounds.height / 10
            stackView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            self.next?.touchesBegan(touches, with: event)
        }
        
        func configureCell(zikirAction: (() -> Void)?, prayerAction: (() -> Void)?, readingAction: (() -> Void)?) {
            self.zikirButtonAction = zikirAction
            self.prayerButtonAction = prayerAction
            self.readingButtonAction = readingAction
        }
        
        @IBAction func goToZikirPage(_ sender: Any) {
            zikirButtonAction?()
        }
        
        @IBAction func goToPrayerPage(_ sender: Any) {
            prayerButtonAction?()
        }
        
        @IBAction func goToReadingPage(_ sender: Any) {
            readingButtonAction?()
        }
    }
    


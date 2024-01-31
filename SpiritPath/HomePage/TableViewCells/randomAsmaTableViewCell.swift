//
//  randomAsmaTableViewCell.swift
//  SpiritPath
//
//  Created by Fatih Akbulut on 11/21/23.
//

import UIKit

class randomAsmaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var asmaName: UILabel!
    @IBOutlet weak var asmaDescription: UITextView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    var buttonAction: (() -> Void)?
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        stackView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.1)
        stackView.layer.cornerRadius = stackView.bounds.height / 12
        
        contentView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureCell(_ Report : Report, buttonAction: (() -> Void)?){
        self.buttonAction = buttonAction
    }
    
    @objc func buttonTapped() {
        buttonAction?()
    }
}

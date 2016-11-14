//
//  BuscaTableViewCell.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class BuscaSwitchTableViewCell: UITableViewCell {

    var valor : (String, Bool)? {
        didSet{
            
            let view = UIView()
            view.backgroundColor = UIColor.background
        
            self.selectedBackgroundView = view
            
            self.indicadorLabel.text = valor?.0
            if let b = valor?.1 {
                self.valorSwitch.isOn = b
            }else {
                self.valorSwitch.isOn = false
            }
        }
    }
    
    @IBOutlet weak var indicadorLabel: UILabel!
    @IBOutlet weak var valorSwitch: UISwitch!
    
    @IBAction func handleSwitch(_ sender: UISwitch) {
        self.valor?.1 = sender.isOn
    }
    
}

class BuscaSegmentedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var escolaSegmented: UISegmentedControl!
}

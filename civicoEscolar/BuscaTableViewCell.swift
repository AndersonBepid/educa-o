//
//  BuscaTableViewCell.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class BuscaSwitchTableViewCell: UITableViewCell {
    
    weak var item : ItemFiltro? {
        didSet{
            let view = UIView()
            view.backgroundColor = UIColor.background
            
            self.selectedBackgroundView = view
            
            self.indicadorLabel.text = item?.nomeItem
            if let b = item?.valor {
                self.valorSwitch.isOn = b
            }else {
                self.valorSwitch.isOn = false
            }
        }
    }
    
    @IBOutlet weak var indicadorLabel: UILabel!
    @IBOutlet weak var valorSwitch: UISwitch!
    
    @IBAction func handleSwitch(_ sender: UISwitch) {
        self.item?.valor = sender.isOn
    }
    
}

class BuscaSegmentedTableViewCell: UITableViewCell {
    
    weak var item : ItemFiltro? {
        didSet{
            let view = UIView()
            view.backgroundColor = UIColor.background
            self.selectedBackgroundView = view
            
            if let b = item?.valor, b == true {
                self.escolaSegmented.selectedSegmentIndex = 1
            }else {
                self.escolaSegmented.selectedSegmentIndex = 0
            }
        }
    }
    
    @IBOutlet weak var escolaSegmented: UISegmentedControl!
    
    @IBAction func handleSegmented(_ sender: Any) {
        if self.escolaSegmented.selectedSegmentIndex == 0 {
            self.item?.valor = false
        } else {
            self.item?.valor = true
        }
    }
}

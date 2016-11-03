//
//  DetalheController.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 03/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class DetalheController: UIViewController {

    weak var escola: Escola? {
        didSet {
            if let nome = self.escola?.nome {
                self.nomeLabel.text = nome
                let frameLabel = NSString(string: nome).boundingRect(with: CGSize(width: self.view.frame.width - 16, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: sizeFont.title.rawValue)], context: nil)
                self.nomeLabelHeightAnchorConstraint?.constant = frameLabel.height + 20
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        self.navigationItem.title  = "Detalhe"
        self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.setupViews()
    }
    
    var nomeLabelHeightAnchorConstraint: NSLayoutConstraint?
    
    private func setupViews() {
        self.view.addSubview(self.nomeLabel)
        
        self.nomeLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        self.nomeLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        self.nomeLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        self.nomeLabelHeightAnchorConstraint =  self.nomeLabel.heightAnchor.constraint(equalToConstant: 24)
        self.nomeLabelHeightAnchorConstraint?.isActive = true
    }
    
    let nomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome da escola"
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(r: 254, g: 79, b: 79)
        label.font = UIFont.systemFont(ofSize: sizeFont.title.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

//
//  CellEscola.swift
//  Escolaqui
//
//  Created by Thiago Vinhote on 13/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

extension String {
    
    func rect(view: UIView) -> CGRect {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: view.frame.width - 40, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14)], context: nil)
        return rect
    }
    
}

class CellEscola: UICollectionViewCell {
    
    @IBOutlet weak var nomeEscola: UILabel!
    @IBOutlet weak var bairroEscola: UILabel!
    @IBOutlet weak var telefoneEscola: UILabel!
    @IBOutlet weak var emailEscola: UILabel!
    @IBOutlet weak var idebEscola: UILabel!
    @IBOutlet weak var imageIdeb: UIImageView!
    @IBOutlet weak var lblIIdeb: UILabel!
    
    @IBOutlet weak var containerNomeHeigthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var emailBottomConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    weak var escola: Escola?{
        didSet{
            self.setupViews()
        }
    }

    private func setupViews() {
        if let nome = self.escola?.nome {
            self.nomeEscola.text = nome
            let r = nome.rect(view: self)
            self.containerNomeHeigthConstraint.constant = r.height + 20
        } else {
            self.nomeEscola.text = nil
        }
        if let bairro = self.escola?.endereco?.bairro {
            self.bairroEscola.text = "Bairro: \(bairro)"
        } else {
            self.bairroEscola.text = nil
        }
        if let telefone = self.escola?.telefone {
            self.telefoneEscola.text = "Telefone: \(telefone)"
        } else {
            self.telefoneEscola.text = nil
        }
        if let email = self.escola?.email {
            self.emailEscola.text = "Email: \(email.lowercased())"
        } else {
            self.emailEscola.text = nil
        }
        
        guard let id = self.escola?.codEscola else {
            return
        }
        EscolaStore.singleton.fetchIdeb(id) { (ideb: Ideb?, error: Error?) in
            if error != nil {
                print(error!)
                return
            }
    
            if self.escola?.ideb == nil {
                self.escola?.ideb = ideb
                if let media = ideb?.media {
                    self.idebEscola.text = String(format: "%.1f", media)
                    self.imageIdeb.isHidden = false
                    self.idebEscola.isHidden = false
                    self.lblIIdeb.isHidden = false
                } else {
                    self.imageIdeb.isHidden = true
                    self.idebEscola.isHidden = true
                    self.lblIIdeb.isHidden = true
                }
            } else if let media = ideb?.media {
                self.idebEscola.text = String(format: "%.1f", media)
                self.imageIdeb.isHidden = false
                self.idebEscola.isHidden = false
                self.lblIIdeb.isHidden = false
            } else {
                self.imageIdeb.isHidden = true
                self.idebEscola.isHidden = true
                self.lblIIdeb.isHidden = true
            }
        }
    }
}

//
//  CellHome.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 03/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

enum sizeFont: CGFloat {
    case title = 15
    case subtitle = 13
}

class CellHome: UICollectionViewCell {
    
    weak var escola: Escola? {
        didSet{
            if let nome = self.escola?.nome {
                self.nomeLabel.text = nome
            }
            if let red = self.escola?.rede {
                self.redeLabel.text = "Rede: \(red)"
            }
            if let bairro = self.escola?.endereco?.bairro {
                self.bairroLabel.text = "Bairro: \(bairro)"
            }
            if let telefone = self.escola?.telefone {
                self.telefoneLabel.text = "Telefone: \(telefone)"
            }
            if let temIndigena = self.escola?.infraestrutura?.temEducacaoIndigena, temIndigena == "S"{
                self.educacaoIndigenaLabel.backgroundColor = UIColor(r: 254, g: 79, b: 79)
            } else {
                self.educacaoIndigenaLabel.backgroundColor = UIColor(r: 236, g: 236, b: 236)
            }
            
            if let temJovemAdulto = self.escola?.infraestrutura?.temEducacaoJovemAdulto, temJovemAdulto == "S"{
                self.educacaoJovemAdultoLabel.backgroundColor = UIColor(r: 254, g: 79, b: 79)
            } else {
                self.educacaoJovemAdultoLabel.backgroundColor = UIColor(r: 236, g: 236, b: 236)
            }
            
            if let temEspecializada = self.escola?.infraestrutura?.atendeEducacaoEspecializada, temEspecializada == "S"{
                self.educacaoEspecializadaLabel.backgroundColor = UIColor(r: 254, g: 79, b: 79)
            } else {
                self.educacaoEspecializadaLabel.backgroundColor = UIColor(r: 236, g: 236, b: 236)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        self.addSubview(self.nomeLabel)
        self.addSubview(self.separador)
        self.addSubview(self.separadorVertical)
        self.addSubview(self.redeLabel)
        self.addSubview(self.bairroLabel)
        self.addSubview(self.telefoneLabel)
        self.addSubview(self.educacaoLabel)
        self.addSubview(self.educacaoIndigenaLabel)
        self.addSubview(self.educacaoEspecializadaLabel)
        self.addSubview(self.educacaoJovemAdultoLabel)
        
        self.nomeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.nomeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.nomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        
        self.separador.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.separador.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.separador.heightAnchor.constraint(equalToConstant: 1).isActive = true
        self.separador.topAnchor.constraint(equalTo: self.nomeLabel.bottomAnchor, constant: 0).isActive = true
        
        self.separadorVertical.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 50).isActive = true
        self.separadorVertical.topAnchor.constraint(equalTo: self.separador.bottomAnchor, constant: 8).isActive = true
        self.separadorVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        self.separadorVertical.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.redeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.redeLabel.rightAnchor.constraint(equalTo: self.separadorVertical.leftAnchor, constant: -8).isActive = true
        self.redeLabel.topAnchor.constraint(equalTo: self.separador.bottomAnchor, constant: 8).isActive = true
        
        self.bairroLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.bairroLabel.rightAnchor.constraint(equalTo: self.separadorVertical.leftAnchor, constant: -8).isActive = true
        self.bairroLabel.topAnchor.constraint(equalTo: self.redeLabel.bottomAnchor, constant: 8).isActive = true
        
        self.telefoneLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.telefoneLabel.rightAnchor.constraint(equalTo: self.separadorVertical.leftAnchor, constant: -8).isActive = true
        self.telefoneLabel.topAnchor.constraint(equalTo: self.bairroLabel.bottomAnchor, constant: 8).isActive = true
        
        self.educacaoLabel.leftAnchor.constraint(equalTo: self.separadorVertical.rightAnchor, constant: 8).isActive = true
        self.educacaoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.educacaoLabel.topAnchor.constraint(equalTo: self.separador.bottomAnchor, constant: 8).isActive = true
        
        self.educacaoIndigenaLabel.topAnchor.constraint(equalTo: self.educacaoLabel.bottomAnchor, constant: 8).isActive = true
        self.educacaoIndigenaLabel.leftAnchor.constraint(equalTo: self.separadorVertical.rightAnchor, constant: 8).isActive = true
        self.educacaoIndigenaLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.educacaoIndigenaLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.educacaoEspecializadaLabel.topAnchor.constraint(equalTo: self.educacaoIndigenaLabel.bottomAnchor, constant: 8).isActive = true
        self.educacaoEspecializadaLabel.leftAnchor.constraint(equalTo: self.separadorVertical.rightAnchor, constant: 8).isActive = true
        self.educacaoEspecializadaLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.educacaoEspecializadaLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.educacaoJovemAdultoLabel.topAnchor.constraint(equalTo: self.educacaoEspecializadaLabel.bottomAnchor, constant: 8).isActive = true
        self.educacaoJovemAdultoLabel.leftAnchor.constraint(equalTo: self.separadorVertical.rightAnchor, constant: 8).isActive = true
        self.educacaoJovemAdultoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.educacaoJovemAdultoLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    let nomeLabel : UILabel = {
        let label = UILabel()
        label.text = "Teste"
        label.lineBreakMode = .byTruncatingMiddle
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: sizeFont.title.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separador: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let redeLabel : UILabel = {
        let label = UILabel()
        label.text = "Rede: Pública"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bairroLabel : UILabel = {
        let label = UILabel()
        label.text = "Bairro: PRESIDENTE VARGAS"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let telefoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Telefone: 92 32154623"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separadorVertical: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let educacaoLabel: UILabel = {
        let label = UILabel()
        label.text = "Educação"
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let educacaoIndigenaLabel: UILabel = {
        let label = UILabel()
        label.text = "Indígena"
        label.textColor = .black
        label.backgroundColor = UIColor(r: 254, g: 79, b: 79)
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let educacaoEspecializadaLabel: UILabel = {
        let label = UILabel()
        label.text = "Especializada"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let educacaoJovemAdultoLabel: UILabel = {
        let label = UILabel()
        label.text = "Jovem / Adulto"
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        label.font = UIFont.systemFont(ofSize: sizeFont.subtitle.rawValue)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

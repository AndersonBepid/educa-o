//
//  BuscaController.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 31/10/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

//F7F7F7 - 247, 247, 247
//FE4F4F - 254, 79, 79
//ECECEC - 236, 236, 236

class BuscaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        
        self.navigationItem.title = "Busca"
        self.setupBarButtons()
        self.setupView()
    }
    
    private func setupBarButtons() {
        let cancelBarButtom : UIBarButtonItem = {
            let b = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(self.handleCancel))
            return b
        }()
        self.navigationItem.leftBarButtonItem = cancelBarButtom
    }
    
    func handleCancel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    private func setupView() {
        self.view.addSubview(self.subTitleViewEscola)
        self.view.addSubview(self.segmentedControlEscola)
        self.view.addSubview(self.subTitleViewEnsino)
        self.view.addSubview(self.switchFundamental)
        self.view.addSubview(self.switchMedio)
        self.view.addSubview(self.switchProfissionalizante)

        
        //constraint subtitle escola
        self.subTitleViewEscola.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.subTitleViewEscola.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewEscola.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewEscola.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint segmented escola
        self.segmentedControlEscola.topAnchor.constraint(equalTo: self.subTitleViewEscola.bottomAnchor, constant: 8).isActive = true
        self.segmentedControlEscola.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.segmentedControlEscola.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        self.segmentedControlEscola.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //constraint subtitle ensino
        self.subTitleViewEnsino.topAnchor.constraint(equalTo: self.segmentedControlEscola.bottomAnchor, constant: 8).isActive = true
        self.subTitleViewEnsino.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewEnsino.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewEnsino.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        self.switchFundamental.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.switchFundamental.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.switchFundamental.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.switchFundamental.topAnchor.constraint(equalTo: self.subTitleViewEnsino.bottomAnchor, constant: 8).isActive = true
        
        self.switchMedio.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.switchMedio.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.switchMedio.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.switchMedio.topAnchor.constraint(equalTo: self.switchFundamental.bottomAnchor, constant: 8).isActive = true
        
        self.switchProfissionalizante.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.switchProfissionalizante.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.switchProfissionalizante.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.switchProfissionalizante.topAnchor.constraint(equalTo: self.switchMedio.bottomAnchor, constant: 8).isActive = true
        
    }
    
    let subTitleViewEscola: UIView = {
        let view = UIView()
        view.backgroundColor = .faixa
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Escola"
        labelEscola.textColor = .subtitulo
        labelEscola.textAlignment = .center
        labelEscola.font = UIFont.boldSystemFont(ofSize: 15)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelEscola.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let segmentedControlEscola: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Pública", "Privada"])
        segmented.selectedSegmentIndex = 0
        segmented.tintColor = .titulo
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    
    let subTitleViewEnsino: UIView = {
        let view = UIView()
        view.backgroundColor = .faixa
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Ensino"
        labelEscola.textColor = .subtitulo
        labelEscola.textAlignment = .center
        labelEscola.font = UIFont.boldSystemFont(ofSize: 15)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelEscola.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    lazy var switchFundamental: UIView = {
        let viewSwitch: UIView = self.labelAndSwitch("Fundamental", #selector(handleSwitchFundamental))
        viewSwitch.translatesAutoresizingMaskIntoConstraints = false
        return viewSwitch
    }()
    
    func handleSwitchFundamental() {
        print(#function)
    }
    
    lazy var switchMedio: UIView = {
        let viewSwitch: UIView = self.labelAndSwitch("Médio", #selector(handleSwitchMedio))
        viewSwitch.translatesAutoresizingMaskIntoConstraints = false
        return viewSwitch
    }()
    
    func handleSwitchMedio() {
        print(#function)
    }
    
    lazy var switchProfissionalizante: UIView = {
        let viewSwitch: UIView = self.labelAndSwitch("Profissionalizante", #selector(handleSwitchProfissionalizante))
        viewSwitch.translatesAutoresizingMaskIntoConstraints = false
        return viewSwitch
    }()
    
    func handleSwitchProfissionalizante() {
        print(#function)
    }
    
    private func labelAndSwitch(_ text: String, _ selector: Selector) -> UIView{
        let labelMedio : UILabel = {
            let label = UILabel()
            label.text = text
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .fonte
            return label
        }()
        
        let switchEnsinoMedio: UISwitch = {
            let switchView = UISwitch()
            switchView.translatesAutoresizingMaskIntoConstraints = false
            switchView.tintColor = .titulo
            switchView.onTintColor = .titulo
            switchView.setOn(false, animated: true)
            switchView.addTarget(self, action: selector, for: .valueChanged)
            return switchView
        }()
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMedio)
        view.addSubview(switchEnsinoMedio)

        switchEnsinoMedio.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        switchEnsinoMedio.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        labelMedio.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        labelMedio.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelMedio.heightAnchor.constraint(equalTo: switchEnsinoMedio.heightAnchor).isActive = true
        labelMedio.rightAnchor.constraint(equalTo: switchEnsinoMedio.leftAnchor).isActive =  true
    
//        switchEnsinoMedio.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        return view
    }
}

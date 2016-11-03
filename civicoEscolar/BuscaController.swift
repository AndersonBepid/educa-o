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

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
    
}

/*
 Pública ou privada*
 Quadra aberta ou coberta*
 Lab. De informática*
 Lab de ciências*
 Ensino médio profissionalizante*
 Ensino médio integrado*
 Educação jovem adulto*
 Educação indígena*
 Educação especializada*
 Tem creche*
 Tem biblioteca*
 Berçário*
 Tem acessibilidade*
 Oferece alimentação*
 tem internet*
 */

class BuscaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(r: 247, g: 247, b: 247)
        self.navigationItem.title = "View de busca"
        self.setupBarButtons()
        self.setupView()
    }
    
    private func setupBarButtons() {
        let cancelBarButtom : UIBarButtonItem = {
            let b = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(self.handleCancel))
            b.tintColor = .black
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
        //self.view.addSubview(self.subTitleViewQuadra)
        self.view.addSubview(self.segmentedControlQuadra)
        self.view.addSubview(self.subTitleViewLab)
        self.view.addSubview(self.switchInformatica)
        self.view.addSubview(self.switchCiencia)
        self.view.addSubview(self.subTitleViewEnsino)
        self.view.addSubview(self.switchEnsinoMedio)
        self.view.addSubview(self.switchEnsinoProfissionalizante)
        self.view.addSubview(self.subTitleViewEducacao)
        self.view.addSubview(self.switchEducacaoIndigena)
        self.view.addSubview(self.switchEducacaoJovemAdulto)
        self.view.addSubview(self.switchEducacaoEspecializada)
        self.view.addSubview(self.subTitleViewCaracteristicas)
        self.view.addSubview(self.switchCaraCreche)
        self.view.addSubview(self.switchCaraBercario)
        self.view.addSubview(self.switchCaraInternet)
        self.view.addSubview(self.switchCaraBiblioteca)
        self.view.addSubview(self.switchCaraAcessibilidade)
        self.view.addSubview(self.switchCaraAlimentacao)
        
        //constraint subtitle escola
        self.subTitleViewEscola.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.subTitleViewEscola.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewEscola.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewEscola.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint segmented escola
        self.segmentedControlEscola.topAnchor.constraint(equalTo: self.subTitleViewEscola.bottomAnchor, constant: 8).isActive = true
        self.segmentedControlEscola.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.segmentedControlEscola.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        self.segmentedControlEscola.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint subtitle quadra
        //self.subTitleViewQuadra.topAnchor.constraint(equalTo: self.segmentedControlEscola.bottomAnchor, constant: 8).isActive = true
        //self.subTitleViewQuadra.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //self.subTitleViewQuadra.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        //self.subTitleViewQuadra.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint segmented escola
        self.segmentedControlQuadra.topAnchor.constraint(equalTo: self.subTitleViewEscola.bottomAnchor, constant: 8).isActive = true
        self.segmentedControlQuadra.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.segmentedControlQuadra.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        self.segmentedControlQuadra.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint subtitle quadra
        self.subTitleViewLab.topAnchor.constraint(equalTo: self.segmentedControlQuadra.bottomAnchor, constant: 8).isActive = true
        self.subTitleViewLab.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewLab.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewLab.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint switch informatica
        self.switchInformatica.topAnchor.constraint(equalTo: self.subTitleViewLab.bottomAnchor, constant: 8).isActive = true
        self.switchInformatica.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchInformatica.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch ciencia
        self.switchCiencia.topAnchor.constraint(equalTo: self.subTitleViewLab.bottomAnchor, constant: 8).isActive = true
        self.switchCiencia.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchCiencia.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint subtitle ensino
        self.subTitleViewEnsino.topAnchor.constraint(equalTo: self.switchCiencia.bottomAnchor, constant: 8).isActive = true
        self.subTitleViewEnsino.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewEnsino.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewEnsino.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint switch médio integrado
        self.switchEnsinoMedio.topAnchor.constraint(equalTo: self.subTitleViewEnsino.bottomAnchor, constant: 8).isActive = true
        self.switchEnsinoMedio.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchEnsinoMedio.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch médio profissionalizante
        self.switchEnsinoProfissionalizante.topAnchor.constraint(equalTo: self.subTitleViewEnsino.bottomAnchor, constant: 8).isActive = true
        self.switchEnsinoProfissionalizante.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchEnsinoProfissionalizante.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint subtitle educação
        self.subTitleViewEducacao.topAnchor.constraint(equalTo: self.switchEnsinoProfissionalizante.bottomAnchor, constant: 8).isActive = true
        self.subTitleViewEducacao.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewEducacao.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewEducacao.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint switch educação indigena
        self.switchEducacaoIndigena.topAnchor.constraint(equalTo: self.subTitleViewEducacao.bottomAnchor, constant: 8).isActive = true
        self.switchEducacaoIndigena.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchEducacaoIndigena.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch educação jovem adulto
        self.switchEducacaoJovemAdulto.topAnchor.constraint(equalTo: self.switchEducacaoIndigena.bottomAnchor, constant: 8).isActive = true
        self.switchEducacaoJovemAdulto.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchEducacaoJovemAdulto.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint swithc educação profissionalizante
        self.switchEducacaoEspecializada.topAnchor.constraint(equalTo: self.subTitleViewEducacao.bottomAnchor, constant: 8).isActive = true
        self.switchEducacaoEspecializada.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchEducacaoEspecializada.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint subtitle característica
        self.subTitleViewCaracteristicas.topAnchor.constraint(equalTo: self.switchEducacaoJovemAdulto.bottomAnchor, constant: 8).isActive = true
        self.subTitleViewCaracteristicas.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.subTitleViewCaracteristicas.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.subTitleViewCaracteristicas.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        //constraint switch caracterísitca creche
        self.switchCaraCreche.topAnchor.constraint(equalTo: self.subTitleViewCaracteristicas.bottomAnchor, constant: 8).isActive = true
        self.switchCaraCreche.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchCaraCreche.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch caracterísitca acessibilidade
        self.switchCaraAcessibilidade.topAnchor.constraint(equalTo: self.subTitleViewCaracteristicas.bottomAnchor, constant: 8).isActive = true
        self.switchCaraAcessibilidade.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchCaraAcessibilidade.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch caracterísitca berçário
        self.switchCaraBercario.topAnchor.constraint(equalTo: self.switchCaraCreche.bottomAnchor, constant: 8).isActive = true
        self.switchCaraBercario.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchCaraBercario.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch caracterísitca alimentação
        self.switchCaraAlimentacao.topAnchor.constraint(equalTo: self.switchCaraAcessibilidade.bottomAnchor, constant: 8).isActive = true
        self.switchCaraAlimentacao.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchCaraAlimentacao.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch caracterísitca biblioteca
        self.switchCaraBiblioteca.topAnchor.constraint(equalTo: self.switchCaraBercario.bottomAnchor, constant: 8).isActive = true
        self.switchCaraBiblioteca.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 18).isActive = true
        self.switchCaraBiblioteca.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        //constraint switch caracterísitca internet
        self.switchCaraInternet.topAnchor.constraint(equalTo: self.switchCaraAlimentacao.bottomAnchor, constant: 8).isActive = true
        self.switchCaraInternet.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -18).isActive = true
        self.switchCaraInternet.heightAnchor.constraint(equalToConstant: 36).isActive = true
    }
    
    let subTitleViewEscola: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Escola"
        labelEscola.font = UIFont.systemFont(ofSize: 18)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        let labelQuadra = UILabel()
        labelQuadra.text = "Quadra"
        labelQuadra.font = UIFont.systemFont(ofSize: 18)
        labelQuadra.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(labelQuadra)
        labelQuadra.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 18).isActive = true
        labelQuadra.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let segmentedControlEscola: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Pública", "Privada"])
        segmented.selectedSegmentIndex = 0
        segmented.tintColor = UIColor(r: 254, g: 79, b: 79)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    let subTitleViewQuadra: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelQuadra = UILabel()
        labelQuadra.text = "Quadra"
        labelQuadra.font = UIFont.systemFont(ofSize: 18)
        labelQuadra.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelQuadra)
        labelQuadra.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelQuadra.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let segmentedControlQuadra: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["Coberta", "Aberta"])
        segmented.selectedSegmentIndex = 0
        segmented.tintColor = UIColor(r: 254, g: 79, b: 79)
        segmented.translatesAutoresizingMaskIntoConstraints = false
        return segmented
    }()
    
    let subTitleViewLab: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Laboratório"
        labelEscola.font = UIFont.systemFont(ofSize: 18)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let switchInformatica: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Informática"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCiencia: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Ciência"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let subTitleViewEnsino: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Ensino"
        labelEscola.font = UIFont.systemFont(ofSize: 18)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let switchEnsinoMedio: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Médio"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchEnsinoProfissionalizante: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Profissionalizante"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let subTitleViewEducacao: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Educação"
        labelEscola.font = UIFont.systemFont(ofSize: 18)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let switchEducacaoJovemAdulto: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Jovem / Adulto"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchEducacaoIndigena: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Indígena"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchEducacaoEspecializada: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Especializada"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let subTitleViewCaracteristicas: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 236, g: 236, b: 236)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let labelEscola = UILabel()
        labelEscola.text = "Caracteristíca"
        labelEscola.font = UIFont.systemFont(ofSize: 18)
        labelEscola.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelEscola)
        labelEscola.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        labelEscola.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    let switchCaraCreche: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Creche"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCaraBiblioteca: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Biblioteca"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCaraBercario: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Berçário"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCaraAcessibilidade: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Acessibilidade"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCaraInternet: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Internet"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
    
    let switchCaraAlimentacao: UISwitch = {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.tintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.onTintColor = UIColor(r: 254, g: 79, b: 79)
        switchView.setOn(false, animated: true)
        
        let label = UILabel()
        label.text = "Alimentação"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        switchView.addSubview(label)
        label.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -8).isActive = true
        label.centerYAnchor.constraint(equalTo: switchView.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: switchView.heightAnchor).isActive = true
        
        return switchView
    }()
}

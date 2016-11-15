//
//  DetalheViewController.swift
//  Escolaqui
//
//  Created by Thiago Vinhote on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {
    
    @IBOutlet weak var voltarBt: UIBarButtonItem!
    
    @IBOutlet weak var labelBairro: UILabel!
    @IBOutlet weak var labelTelefone: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var labelIdeb: UILabel!
    @IBOutlet weak var imageIdeb: UIImageView!
    
    @IBOutlet weak var labelTipoEscola: UILabel!
    @IBOutlet weak var labelEnderecoDescricao: UILabel!
    
    weak var escola: Escola!
    var infra: Infraestutura?
    
    @IBOutlet weak var nomeHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var tableCaract: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.voltarBt.customView?.layer.shadowRadius = 1
        self.voltarBt.customView?.layer.shadowOpacity = 0.5
        
        self.navigationItem.title = "Detalhe"
        self.setupViews()
        self.tableCaract.delegate = self
        self.tableCaract.dataSource = self
        self.infra = self.escola.infraestrutura
    }
    
    
    @IBAction func voltar() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func setupViews() {
        if let nome = escola.nome {
            let rect = nome.rect(view: self.labelNome)
            self.nomeHeightConstraint.constant = rect.height + 20
            self.labelNome.text = nome
        }
        if let bairro = escola.endereco?.bairro{
            self.labelBairro.text = "Bairro: \(bairro)"
        }
        if let telefone = escola.telefone {
            self.labelTelefone.text = "Telefone: \(telefone)"
        }
        if let email = escola.email {
            self.labelEmail.text = "Email: \(email.lowercased())"
        }
        
        if let media = escola.ideb?.media {
            self.labelIdeb.text = String(format: "%.1f", media)
        } else {
            self.labelIdeb.isHidden = true
            self.imageIdeb.isHidden = true
        }
        
        if let rede = self.escola.rede {
            self.labelTipoEscola.text = "Rede: \(rede)"
        }
        if let descricao = self.escola.endereco?.descricao {
            self.labelEnderecoDescricao.text = "Endereço: \(descricao)"
        } else {
            self.labelEnderecoDescricao.text = nil
        }
    }
}

extension DetalheViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(ItemFiltroStore.singleton.itens.keys).count - 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keys = Array(ItemFiltroStore.singleton.itens.keys)
        let itens = ItemFiltroStore.singleton.itens[keys[section]]
        if keys[section] == "Escola" {
            return 0
        }
        return itens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = Array(ItemFiltroStore.singleton.itens.keys)
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        
        if keys[indexPath.section] != "Escola", let infra = self.infra {
            let item = ItemFiltroStore.singleton.itens[keys[indexPath.section]]?[indexPath.row]
            cell.textLabel?.text = item?.nomeItem
            
            if let c = item?.chave, c != "rede" {
                if let v = infra.value(forKey: c) as? String{
                    if v == "S" {
                        cell.detailTextLabel?.text = "Possui"
                    } else {
                        cell.detailTextLabel?.text = "Não possui"
                    }
                }
            }
        }
        return cell
    }
    
    
    
}

extension DetalheViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sec = Array(ItemFiltroStore.singleton.itens.keys)[section]
        if sec == "Escola" {
            return 0
        }
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sec = Array(ItemFiltroStore.singleton.itens.keys)[section]
        if sec != "Escola" {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
            let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
            
            labelTitle.text = sec
            labelTitle.textAlignment = .center
            labelTitle.textColor = UIColor(r: 214, g: 195, b: 114)
            labelTitle.font = UIFont.systemFont(ofSize: 15)
            
            view.addSubview(labelTitle)
            view.backgroundColor = UIColor(r: 22, g: 38, b: 52)
            
            return view
        }
        return nil
    }
    
}

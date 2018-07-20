//
//  BuscaViewController.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class ItemFiltro: NSObject {
    var nomeItem: String?
    var chave: String?
    var valor: Bool?
    
    override var description: String {
        return "\(self.nomeItem) \(self.valor)"
    }
}

class ItemFiltroStore: NSObject {
    
    static let singleton: ItemFiltroStore = ItemFiltroStore()
    
    var itens : Dictionary<String, [ItemFiltro]> = Dictionary<String, [ItemFiltro]>()

    private override init() {
        super.init()
        self.carregarItensFiltro()
    }
    
    private func carregarItensFiltro() {
        var filtrosDeBusca: [[(String, String, Bool)]] = [
            [("Fundamental", "temEnsinoFundamental", false), ("Médio", "temEnsinoMedio", false), ("Profissionalizante", "temEnsinoMedioProfissional", false), ("Integrado", "temEnsinoMedioIntegrado", false)],
            [("Jovem/Adulto", "temEducacaoJovemAdulto", false), ("Indigena", "temEducacaoIndigena", false), ("Especializada","atendeEducacaoEspecializada", false)],
            [("Coberta", "temQuadraEsporteCoberta", false), ("Descoberta", "temQuadraEsporteDescoberta", false)],
            [("Ciências", "temLaboratorioCiencias", false), ("Informática","temLaboratorioInformatica", false)],
            [("Creche", "temCreche", false), ("Berçário", "temBercario", false), ("Acessibilidade", "temAcessibilidade", false), ("Parque Infantil", "temParqueInfantil", false),("Biblioteca", "temBiblioteca", false), ("Área Verde", "temAreaVerde", false)], [("", "rede", false)]]
        let tittleSections = ["Ensino", "Educação", "Quadra", "Laboratório", "Outros"]
        
        
        for (index, section) in tittleSections.enumerated() {
            let tupla = filtrosDeBusca[index]
            var itensFiltro : [ItemFiltro] = []
            tupla.forEach({ (item: (String, String, Bool)) in
                let i = ItemFiltro()
                i.nomeItem = item.0
                i.chave = item.1
                i.valor = item.2
                itensFiltro.append(i)
            })
            self.itens.updateValue(itensFiltro, forKey: section)
        }
    }
    
    func zerarStatus() {
        itens.forEach { (item: (key: String, value: [ItemFiltro])) in
            item.value.forEach({ (item: ItemFiltro) in
                item.valor = false
            })
        }
    }
}

class BuscaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var rede: String?
    var infra: SectionInfra?
    weak var homeEscola: HomeEscolaController?
    
    @IBOutlet weak var localizarBt: UIButton!
    @IBOutlet weak var fecharBt: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rede = InfraStore.singleton.getInfra().0
        self.infra = SectionInfra(InfraStore.singleton.getInfra().1)
        
    }
    @IBAction func handleFechar() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func handleLocalizar() {
        
        var itensFiltro: [ItemFiltro] = []
        ItemFiltroStore.singleton.itens.forEach { (dic: (key: String, value: [ItemFiltro])) in
            dic.value.forEach({ (item: ItemFiltro) in
                if let v = item.valor, v == true {
                    itensFiltro.append(item)
                }
            })
        }
        print(itensFiltro)
        self.dismiss(animated: true, completion: nil)
        self.homeEscola?.filtrarEscolas(itensFiltro)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(ItemFiltroStore.singleton.itens.keys).count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.filtrosDeBusca[section].count
        let keys = Array(ItemFiltroStore.singleton.itens.keys)
        let itens = ItemFiltroStore.singleton.itens[keys[section]]
        return itens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let keys = Array(ItemFiltroStore.singleton.itens.keys)
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BuscaSwitchTableViewCell
        cell.item = ItemFiltroStore.singleton.itens[keys[indexPath.section]]?[indexPath.item]
        
        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        
        labelTitle.text = Array(ItemFiltroStore.singleton.itens.keys)[section]
        labelTitle.textAlignment = .center
        labelTitle.textColor = UIColor(r: 214, g: 195, b: 114)
        labelTitle.font = UIFont.systemFont(ofSize: 15)
        
        view.addSubview(labelTitle)
        view.backgroundColor = UIColor(r: 22, g: 38, b: 52)
        
        return view
    }
}

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
    var valor: Bool?
}

class ItemFiltroStore: NSObject {
    
    static let singleton: ItemFiltroStore = ItemFiltroStore()
    
    var itens : Dictionary<String, [ItemFiltro]> = Dictionary<String, [ItemFiltro]>()

    private override init() {
        super.init()
        self.carregarItensFiltro()
    }
    
    private func carregarItensFiltro() {
        var filtrosDeBusca: [[(String, Bool)]] = [[("", false)], [("Fundamental", false), ("Médio", false), ("Profissionalizante",false), ("Integrado", false)], [("Jovem/Adulto", false), ("Indigena", false), ("Especializada", false)], [("Coberta", false), ("Descoberta", false)], [("Ciências", false), ("Informática", false)], [("Creche", false), ("Berçário", false), ("Acessibilidade", false), ("Parque Infantil", false), ("Biblioteca", false), ("Área Verde",false)]]
        let tittleSections = ["Escola", "Ensino", "Educação", "Quadra", "Laboratório", "Outros"]
        
        
        for (index, section) in tittleSections.enumerated() {
            let tupla = filtrosDeBusca[index]
            var itensFiltro : [ItemFiltro] = []
            tupla.forEach({ (chave: String,valor: Bool) in
                let i = ItemFiltro()
                i.nomeItem = chave
                i.valor = valor
                itensFiltro.append(i)
            })
            self.itens.updateValue(itensFiltro, forKey: section)
        }
    }
}

class BuscaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var filtrosDeBusca: [[(String, Bool)]] = [[("", false)], [("Fundamental", false), ("Médio", false), ("Profissionalizante",false), ("Integrado", false)], [("Jovem/Adulto", false), ("Indigena", false), ("Especializada", false)], [("Coberta", false), ("Descoberta", false)], [("Ciências", false), ("Informática", false)], [("Creche", false), ("Berçário", false), ("Acessibilidade", false), ("Parque Infantil", false), ("Biblioteca", false), ("Área Verde",false)]]
    let tittleSections = ["Escola", "Ensino", "Educação", "Quadra", "Laboratório", "Outros"]
    
    var rede: String?
    var infra: SectionInfra?
    
    @IBOutlet weak var localizarBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.localizarBt.layer.shadowRadius = 1
        self.localizarBt.layer.shadowOpacity = 1

        self.rede = InfraStore.singleton.getInfra().0
        self.infra = SectionInfra(InfraStore.singleton.getInfra().1)
        
    }
    @IBAction func handleFechar() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func handleLocalizar() {
        print(self.filtrosDeBusca)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.tittleSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.filtrosDeBusca[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as! BuscaSegmentedTableViewCell
            
            if self.rede == "Privada" {
                cell.escolaSegmented.selectedSegmentIndex = 1
            }else {
                cell.escolaSegmented.selectedSegmentIndex = 0
            }
            
            
            return cell
        }else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! BuscaSwitchTableViewCell
            cell.valor = self.filtrosDeBusca[indexPath.section][indexPath.row]
           
            
            return cell
        }
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 5 {
           
            return 70
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        
        labelTitle.text = self.tittleSections[section]
        labelTitle.textAlignment = .center
        labelTitle.textColor = UIColor(r: 214, g: 195, b: 114)
        labelTitle.font = UIFont.systemFont(ofSize: 15)
        
        view.addSubview(labelTitle)
        view.backgroundColor = UIColor(r: 22, g: 38, b: 52)
        
        return view
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  BuscaViewController.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class BuscaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let filtrosDeBusca = [[""], ["Fundamental", "Médio", "Profissionalizante", "Integrado"], ["Jovem/Adulto", "Indigena", "Especializada"], ["Coberta", "Descoberta"], ["Ciências", "Informática"], ["Creche", "Berçário", "Acessibilidade", "Parque Infantil", "Biblioteca", "Área Verde"]]
    let tittleSections = ["Escola", "Ensino", "Educação", "Quadra", "Laboratório", "Outros"]
    
    var rede: String?
    var infra: SectionInfra?
    
    @IBOutlet weak var localizarBt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.localizarBt.layer.shadowRadius = 1
        self.localizarBt.layer.shadowOpacity = 1
        
//        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: self.view.frame.height))
//        labelTitle.text = "Busca"
//        labelTitle.textColor = UIColor(r: 89, g: 194, b: 177)
//        labelTitle.font = UIFont.systemFont(ofSize: 20)
//        self.navigationItem.titleView = labelTitle
        
        self.rede = InfraStore.singleton.getInfra().0
        self.infra = SectionInfra(InfraStore.singleton.getInfra().1)
        
    }
    @IBAction func handleFechar() {
        self.dismiss(animated: true, completion: nil)
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
            
            cell.indicadorLabel.text = self.filtrosDeBusca[indexPath.section][indexPath.row]
            if self.infra?.filtro?[indexPath.section][indexPath.row] == "S" {
                
                cell.valorSwitch.isOn = true
            }else {
                cell.valorSwitch.isOn = false
            }
            
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

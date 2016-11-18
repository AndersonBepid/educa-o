//
//  HomeEscolaController.swift
//  Escolaqui
//
//  Created by Thiago Vinhote on 13/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellid"

class HomeEscolaController: UICollectionViewController {

    var escolas: [Escola]?
    var endereco: Endereco?
    
    @IBOutlet weak var labelSemEscola: UILabel!
    @IBOutlet weak var filtroBt: UIBarButtonItem!
    @IBOutlet weak var bandeiraBt: UIBarButtonItem!
    
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*** If needed Assign Title Here ***/
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        self.bandeiraBt.customView?.layer.shadowRadius = 1
        self.bandeiraBt.customView?.layer.shadowOpacity = 0.5

        self.filtroBt.customView?.layer.shadowRadius = 1
        self.filtroBt.customView?.layer.shadowOpacity = 0.5
        
        self.fetchEscolas(self.endereco)
    }
    
    func fetchEscolas(_ endereco: Endereco?) {
        self.endereco = endereco
        if self.endereco == nil {
            self.endereco = EnderecoStore.singleton.getEndereco()
        }
        
        guard let e = self.endereco else {
            self.perform(#selector(self.handleEndereco), with: nil, afterDelay: 0)
            return
        }
        if !self.refresh.isRefreshing {
            self.lock()
        }
        ItemFiltroStore.singleton.zerarStatus()
        EscolaStore.singleton.fetchEscola(e) { (escolas: [Escola]?, error: Error?) in
            self.unlock()
            self.escolas = escolas
            self.refresh.endRefreshing()
            self.collectionView?.reloadData()
            
            if error != nil{
                print(error!)
            }
        }
        refresh.backgroundColor = UIColor.faixa
        refresh.addTarget(self, action: #selector(self.atualizar), for: .valueChanged)
        self.collectionView?.refreshControl = refresh
    }
    
    
    
    func atualizar() {
        self.fetchEscolas(self.endereco)
    }
    
    @IBAction func handleEndereco() {
        print(#function)
        let estadosNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigationEstados") as! UINavigationController
        let estadoController = estadosNavigation.viewControllers[0] as! EstadosViewController
        estadoController.homeEscola = self
        self.present(estadosNavigation, animated: true, completion: nil)
    }
    
    @IBAction func handleFiltrar() {
        let navigationBusca = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigationBusca") as! UINavigationController
        let buscaController = navigationBusca.viewControllers[0] as! BuscaViewController
        buscaController.homeEscola = self
        self.present(navigationBusca, animated: true, completion: nil)
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.escolas?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellEscola
    
        weak var escola = self.escolas?[indexPath.row]
        cell.escola = escola
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detalhe", sender: self)
    }
    
    func filtrarEscolas(_ itens: [ItemFiltro]) {
        self.escolas = EscolaStore.singleton.escolas?.filter { (escola: Escola) -> Bool in
            return escola.constainsInfra(itens: itens)
        }
        if let e = self.escolas, e.isEmpty {
            self.labelSemEscola.isHidden = true
        } else {
            self.labelSemEscola.isHidden = false
        }
        self.collectionView?.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalhe" {
            let vc = segue.destination as! DetalheViewController
            vc.escola = self.escolas?[self.collectionView?.indexPathsForSelectedItems?[0].item ?? 0]
        }
    }
}

extension HomeEscolaController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        weak var escola = self.escolas?[indexPath.row]
        var height: CGFloat = 124
        let r = escola?.nome?.rect(view: self.view)
        if let h = r?.height {
            height += h - 20
        }
        return CGSize(width: self.view.frame.width, height: height)
    }
    
}

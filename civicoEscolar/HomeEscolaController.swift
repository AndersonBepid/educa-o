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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        self.lock()
        EscolaStore.singleton.fetchEscola(e) { (escolas: [Escola]?, error: Error?) in
            self.unlock()
            if error != nil{
                print(error!)
                return
            }
            
            self.escolas = escolas
            self.collectionView?.reloadData()
        }
    }
    
    @IBAction func handleEndereco() {
        print(#function)
        let estadosNavigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigationEstados") as! UINavigationController
        let estadoController = estadosNavigation.viewControllers[0] as! EstadosViewController
        estadoController.homeEscola = self
        self.present(estadosNavigation, animated: true, completion: nil)
    }
    
    @IBAction func handleFiltrar() {
        let navigationBusca = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navigationBusca")
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
        let detalhe = DetalheController()
        detalhe.escola = self.escolas?[indexPath.item]
        self.navigationController?.pushViewController(detalhe, animated: true)
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

//
//  HomeController.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit
import CoreLocation

class HomeController: UICollectionViewController {

    let cellId = "cellId"
    var escolas: [Escola]?
    
    let managerLocation: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.collectionView?.register(CellHome.self, forCellWithReuseIdentifier: self.cellId)
        self.collectionView?.alwaysBounceVertical = true
        
        self.navigationItem.title = "Escolas"
        
        self.setupBarButtons()
        self.fetchEscolas()
    }
    
    private func fetchEscolas() {
//        let cord = CLLocation(latitude: -3.011923, longitude: -59.964847)
        //let cord1 = CLLocation(latitude: -3.007209, longitude: -59.973613)
//        guard let localizacao = self.managerLocation.location else {
//            return
//        }
        EscolaStore.singleton.fetchEscola(Endereco()) { (escolas: [Escola]?, error: Error?) in
            if error != nil{
                print(error!)
                return
            }
            
            self.escolas = escolas
            self.collectionView?.reloadData()
            //print(escolas!)
        }
    }
    
    private func setupBarButtons() {
        let filterBarButtonItem : UIBarButtonItem = {
            let b = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(self.handleFilter))
            return b
        }()
        self.navigationItem.rightBarButtonItem = filterBarButtonItem
    }
    
    func handleFilter() {
        let buscaController = BuscaController()
        self.present(UINavigationController(rootViewController: buscaController), animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.escolas?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! CellHome
        
        let escola = self.escolas?[indexPath.item]
        cell.escola = escola

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detalhe = DetalheController()
        detalhe.escola = self.escolas?[indexPath.item]
        self.navigationController?.pushViewController(detalhe, animated: true)
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 30, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
}

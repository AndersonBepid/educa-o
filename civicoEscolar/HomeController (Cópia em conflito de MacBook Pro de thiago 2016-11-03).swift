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
        
        self.managerLocation.delegate = self
        if self.managerLocation.au
        self.managerLocation.requestLocation()
        
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        self.collectionView?.register(CellHome.self, forCellWithReuseIdentifier: self.cellId)
        self.collectionView?.alwaysBounceVertical = true
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 32, height: self.view.frame.height))
        labelTitle.text = "  Escolas"
        labelTitle.textColor = .black
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = labelTitle
        
        self.setupBarButtons()
        self.fetchEscolas()
    }
    
    private func fetchEscolas() {
        EscolaStore.singleton.fetchEscola { (escolas: [Escola]?, error: Error?) in
            if error != nil{
                print(error!)
                return
            }
            
            self.escolas = escolas
            self.collectionView?.reloadData()
            print(escolas!)
        }
    }
    
    private func setupBarButtons() {
        let filterBarButtonItem : UIBarButtonItem = {
            let b = UIBarButtonItem(image: #imageLiteral(resourceName: "filter"), style: .plain, target: self, action: #selector(self.handleFilter))
            b.tintColor = .black
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
}

extension HomeController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.first)
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

//
//  EstadosViewController.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 11/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class EstadosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private let reuseIdentifier = "Cell"
    var estados: [Estado] = []
    var item: Int?
    
    @IBOutlet weak var lousa: UIImageView!
    @IBOutlet weak var mulher: UIImageView!
    @IBOutlet weak var braco: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.mulher.layer.shadowRadius = 1
        self.mulher.layer.shadowOpacity = 1
        
        self.lousa.layer.shadowRadius = 1
        self.lousa.layer.shadowOpacity = 1
        
        self.braco.layer.shadowRadius = 1
        self.braco.layer.shadowOpacity = 1
        
        self.estados = EstadoStore.singleton.getAllEstados()
        
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: self.view.frame.height))
        labelTitle.text = "Estados"
        labelTitle.textColor = UIColor(r: 89, g: 194, b: 177)
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = labelTitle
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.estados.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! EstadosCollectionViewCell
        
        cell.bandeira.image = self.estados[indexPath.item].bandeira
        cell.nomeEstado.text = self.estados[indexPath.item].nome
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.item = indexPath.item
        self.performSegue(withIdentifier: "descricao", sender: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "descricao" {
            
            let nextVC = segue.destination as! EnderecoViewController
            
            nextVC.estado = self.estados[self.item!].nome
            nextVC.bandeira = self.estados[self.item!].bandeira
        }
    }
 

}

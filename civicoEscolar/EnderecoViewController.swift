//
//  EnderecoViewController.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 13/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class EnderecoViewController: UIViewController {

    var estado: String?
    var bandeira: UIImage?
    
    @IBOutlet weak var bandeiraImage: UIImageView!
    @IBOutlet weak var estadoLabel: UILabel!
    
    @IBOutlet weak var ruaLabel: UILabel!
    @IBOutlet weak var bairroLabel: UILabel!
    @IBOutlet weak var cidadeLabel: UILabel!
    
    @IBOutlet weak var ruaTF: UITextField!
    @IBOutlet weak var numeroTF: UITextField!
    @IBOutlet weak var complementoTF: UITextField!
    @IBOutlet weak var bairroTF: UITextField!
    @IBOutlet weak var cidadeTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bandeiraImage.image = self.bandeira
        self.estadoLabel.text = self.estado
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: self.view.frame.height))
        labelTitle.text = "Endereço"
        labelTitle.textColor = UIColor(r: 89, g: 194, b: 177)
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = labelTitle
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(EnderecoViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continuar() {
        
        let endereco = Endereco()
        
        
        if (self.ruaTF.text?.isEmpty)! {
            
            self.ruaLabel.frame.origin.x += 20
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.05, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                
                self.ruaLabel.frame.origin.x -= 20
            }, completion: nil)
            return
        }
        
        if (self.bairroTF.text?.isEmpty)! {
            
            self.bairroLabel.frame.origin.x += 20
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.05, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                
                self.bairroLabel.frame.origin.x -= 20
            }, completion: nil)
            return
        }
        
        if (self.cidadeTF.text?.isEmpty)! {
            
            self.cidadeLabel.frame.origin.x += 20
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.05, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
                
                self.cidadeLabel.frame.origin.x -= 20
            }, completion: nil)
            return
        }
        
        endereco.descricao = "\(self.ruaTF.text!), \(self.numeroTF.text!), \(self.complementoTF.text!)"
        endereco.bairro = self.bairroTF.text!
        endereco.municipio = self.cidadeTF.text!
        endereco.uf = self.estado!
        
        EnderecoStore.singleton.saveEndereco(endereco)
    }
    
    func dismissKeyboard() {
        
        self.resignFirstResponder()
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

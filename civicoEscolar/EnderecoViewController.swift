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
    var endereco: Endereco?
    let widthView = UIScreen.main.bounds.width
    
    @IBOutlet weak var svEndereco: UIStackView!
    
    @IBOutlet weak var voltarBt: UIBarButtonItem!
    
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
    
    @IBOutlet weak var continuarBt: UIBarButtonItem!
    
    weak var homeEscola: HomeEscolaController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = false
        }
        
        self.fetchEndereco()
        
        self.bandeiraImage.image = self.bandeira
        self.estadoLabel.text = self.estado
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(EnderecoViewController.dismissKeyboard))
        swipe.direction = .down
        swipe.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(swipe)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(EnderecoViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(EnderecoViewController.up(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(EnderecoViewController.down(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    func fetchEndereco() {
        self.endereco = EnderecoStore.singleton.getEndereco()
        if let e = self.endereco {
            self.bairroTF.text = e.bairro
            self.cidadeTF.text = e.municipio
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func voltar() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func continuar() {
        
        self.endereco = Endereco()
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
        
        endereco?.descricao = "\(self.ruaTF.text!), \(self.numeroTF.text!), \(self.complementoTF.text!)"
        endereco?.bairro = self.bairroTF.text
        endereco?.municipio = self.cidadeTF.text
        endereco?.uf = self.estado
        
        EnderecoStore.singleton.saveEndereco(endereco)
        self.homeEscola?.fetchEscolas(endereco)
        self.dismiss(animated: true, completion: nil)
    }
    
    func dismissKeyboard() {
        
        self.view.endEditing(true)
    }
    
    func up(_ notification: Notification) {
        
        if self.widthView <= 320.0 {
            self.svEndereco.transform = CGAffineTransform(translationX: 0, y: -35)
        }
    }
    
    func down(_ notification: Notification) {
        
        if self.widthView <= 320.0 {
            self.svEndereco.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }

}

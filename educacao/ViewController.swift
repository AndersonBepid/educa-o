//
//  ViewController.swift
//  educacao
//
//  Created by Anderson Oliveira on 29/10/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var escolasTB: UITableView!
    @IBOutlet weak var cidadeTF: UITextField!
    @IBOutlet weak var ufTF: UITextField!
    
    var escolasCidade : [Escola]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.update(_:)), name:NSNotification.Name(rawValue: "update"), object: self.escolasCidade)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func update(_ notification : NSNotification) {
        print("ok")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        //Handler
        
        return cell
    }

    @IBAction func getInfo() {
        
        let escola = EscolaStore.singleton
        escola.getEscolasCidade(uf: self.ufTF.text!, cidade: self.cidadeTF.text!)
    }
    
    
}


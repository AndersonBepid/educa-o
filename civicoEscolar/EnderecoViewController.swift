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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bandeiraImage.image = self.bandeira
        self.estadoLabel.text = self.estado
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: self.view.frame.height))
        labelTitle.text = "Endereço"
        labelTitle.textColor = UIColor(r: 89, g: 194, b: 177)
        labelTitle.font = UIFont.systemFont(ofSize: 20)
        self.navigationItem.titleView = labelTitle
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  Endereco.swift
//  educacao
//
//  Created by Anderson Oliveira on 03/11/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class Endereco: NSObject {

    var cep : String?
    var descricao : String?
    var bairro : String?
    var municipio : String?
    var uf : String?
    
    init(_ dictionary: [String: AnyObject]?) {
        
        super.init()
        self.cep = dictionary?["cep"] as? String
        self.descricao = dictionary?["descricao"] as? String
        self.bairro = dictionary?["bairro"] as? String
        self.municipio = dictionary?["municipio"] as? String
        self.uf = dictionary?["uf"] as? String
    }
    
}

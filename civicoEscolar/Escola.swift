//
//  Escola.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class Infraestutura: NSObject {
    
    var temQuadraEsporteCoberta : String?
    var temQuadraEsporteDescoberta : String?
    var temLaboratorioInformatica : String?
    var temLaboratorioCiencias : String?
    var temParqueInfantil : String?
    var temBiblioteca : String?
    var temAreaVerde : String?
    var temBercario : String?
    var temAcessibilidade : String?
    var temCreche : String?
    var temEnsinoFundamental : String?
    var temEnsinoMedioProfissional : String?
    var temEnsinoMedioIntegrado : String?
    var temEducacaoJovemAdulto : String?
    var temEducacaoIndigena : String?
    var ofereceAlimentacao : String?
    var atendeEducacaoEspecializada : String?
    
    convenience init(dictionary: [String: Any]) {
        self.init()
        self.setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if self.responds(to: NSSelectorFromString(key)) {
            super.setValue(value, forKey: key)
        }
    }
}

class Endereco: NSObject {
    
    var cep: String?
    var descricao: String?
    var bairro: String?
    var municipio: String?
    var uf: String?
    
    convenience init(dictionary: [String: Any]) {
        self.init()
        self.setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if self.responds(to: NSSelectorFromString(key)) {
            super.setValue(value, forKey: key)
        }
    }
    
    override var description: String {
        get {
            return "\(self.descricao) \(self.bairro) \(self.municipio) \(self.uf)"
        }
    }
}

class Escola: NSObject {
    
    var codEscola: NSNumber?
    var nome: String?
    var rede: String?
    var telefone: String?
    var endereco: Endereco?
    var infraestrutura: Infraestutura?
    var ideb : Float?
    
    convenience init(dictionary: [String: Any]) {
        self.init()
        self.setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if self.responds(to: NSSelectorFromString(key)) {
            switch key {
            case "endereco":
                self.endereco = Endereco(dictionary: value as! [String: Any])
                break
            case "infraestrutura":
                self.infraestrutura = Infraestutura(dictionary: value as! [String: Any])
                break
            default:
                super.setValue(value, forKey: key)
                break
            }
        }
    }
    
    override var description: String {
        get {
            return "\(self.nome), \(self.rede), \(self.codEscola)"
        }
    }
}

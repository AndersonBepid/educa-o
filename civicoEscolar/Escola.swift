
//
//  Escola.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class Infraestutura: NSObject {
    
    var temEnsinoFundamental : String?
    var temEnsinoMedio : String?
    var temEnsinoMedioProfissional : String?
    var temEnsinoMedioIntegrado : String?
    
    var temEducacaoJovemAdulto : String?
    var temEducacaoIndigena : String?
    var atendeEducacaoEspecializada : String?

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
    
    
    var ofereceAlimentacao : String?
    
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

class SectionInfra: NSObject {
    
    var filtro : [[String?]]?
    
    init(_ infra: Infraestutura) {
        
        super.init()
        
        self.filtro?[0][0] = infra.temEnsinoFundamental
        self.filtro?[0][1] = infra.temEnsinoMedio
        self.filtro?[0][2] = infra.temEnsinoMedioProfissional
        self.filtro?[0][3] = infra.temEnsinoMedioIntegrado
        
        self.filtro?[1][0] = infra.temEducacaoJovemAdulto
        self.filtro?[1][1] = infra.temEducacaoIndigena
        self.filtro?[1][2] = infra.atendeEducacaoEspecializada

        self.filtro?[2][0] = infra.temQuadraEsporteCoberta
        self.filtro?[2][1] = infra.temQuadraEsporteDescoberta
        
        self.filtro?[3][0] = infra.temLaboratorioInformatica
        self.filtro?[3][1] = infra.temLaboratorioCiencias
        
        self.filtro?[4][0] = infra.temCreche
        self.filtro?[4][1] = infra.temBercario
        self.filtro?[4][2] = infra.temAcessibilidade
        self.filtro?[4][3] = infra.temParqueInfantil
        self.filtro?[4][4] = infra.temBiblioteca
        self.filtro?[4][5] = infra.temAreaVerde
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
    var email: String?
    var telefone: String?
    var endereco: Endereco?
    var infraestrutura: Infraestutura?
    var ideb : Ideb?
    
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

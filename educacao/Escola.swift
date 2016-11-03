//
//  Escola.swift
//  educacao
//
//  Created by Anderson Oliveira on 29/10/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class Escola: NSObject {
    
    var codEscola : Int?
    var nome : String?
    var rede : String?
    var email : String?
    var esferaAdministrativa : String?
    var situacaoFuncionamento : String?
    var telefone : String?
    var qtdAlunos : Int?
    var endereco : Endereco?
    var temQuadraEsporteCoberta : Bool? = Bool()
    var temQuadraEsporteDescoberta : Bool?
    var temLaboratorioInformatica : Bool?
    var temLaboratorioCiencias : Bool?
    var temParqueInfantil : Bool?
    var temBiblioteca : Bool?
    var temAreaVerde : Bool?
    var temBercario : Bool?
    var temAcessibilidade : Bool?
    var temCreche : Bool?
    var temEnsinoFundamental : Bool?
    var temEnsinoMedioProfissional : Bool?
    var temEnsinoMedioIntegrado : Bool?
    var temEducacaoJovemAdulto : Bool?
    var temEducacaoIndigena : Bool?
    var ofereceAlimentacao : Bool?
    var atendeEducacaoEspecializada : Bool?

    
    init(_ dictionary: [String: AnyObject]) {
        super.init()
        self.codEscola = dictionary["codEscola"] as? Int
        self.nome = dictionary["nome"] as? String
        self.rede = dictionary["rede"] as? String
        self.email = dictionary["email"] as? String
        self.esferaAdministrativa = dictionary["esferaAdministrativa"] as? String
        self.situacaoFuncionamento = dictionary["situacaoFuncionamento"] as? String
        self.endereco = Endereco(dictionary["endereco"] as? [String : AnyObject])
        self.temQuadraEsporteCoberta?.stringForValue(dictionary["infraestrutura"]?["temQuadraEsporteCoberta"] as? String)
        self.temQuadraEsporteDescoberta = dictionary["temQuadraEsporteDescoberta"] as? Bool
        self.temLaboratorioInformatica = dictionary["temLaboratorioInformatica"] as? Bool
        self.temLaboratorioCiencias = dictionary["temLaboratorioCiencias"] as? Bool
        self.temParqueInfantil = dictionary["temParqueInfantil"] as? Bool
        self.temBiblioteca = dictionary["temBiblioteca"] as? Bool
        self.temAreaVerde = dictionary["temAreaVerde"] as? Bool
        self.temBercario = dictionary["temBercario"] as? Bool
        self.temAcessibilidade = dictionary["temAcessibilidade"] as? Bool
        self.temCreche = dictionary["temCreche"] as? Bool
        self.temEnsinoFundamental = dictionary["temEnsinoFundamental"] as? Bool
        self.temEnsinoMedioProfissional = dictionary["temEnsinoMedioProfissional"] as? Bool
        self.temEnsinoMedioIntegrado = dictionary["temEnsinoMedioIntegrado"] as? Bool
        self.temEducacaoJovemAdulto = dictionary["temEducacaoJovemAdulto"] as? Bool
        self.temEducacaoIndigena = dictionary["temEducacaoIndigena"] as? Bool
        self.ofereceAlimentacao = dictionary["ofereceAlimentacao"] as? Bool
        self.atendeEducacaoEspecializada = dictionary["atendeEducacaoEspecializada"] as? Bool
    }
}
extension Bool{
    
    mutating func stringForValue(_ value: String?) {
        
        if value == "S" || value == "s"{
            self = true
        }else {
            self = false
        }
    }
}


//
//  InfraStore.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 14/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class InfraStore: NSObject {

    static let singleton: InfraStore = InfraStore()
    let user = UserDefaults.standard
    
    func saveInfra(_ infra: Infraestutura, rede: String) {
        
        user.set(rede, forKey: "rede")
        user.set(infra.temEnsinoFundamental, forKey: "fundamental")
        user.set(infra.temEnsinoMedio, forKey: "medio")
        user.set(infra.temEnsinoMedioProfissional, forKey: "profissionalizante")
        user.set(infra.temEnsinoMedioIntegrado, forKey: "integrado")
        user.set(infra.temEducacaoJovemAdulto, forKey: "jovemAdulto")
        user.set(infra.temEducacaoIndigena, forKey: "indigena")
        user.set(infra.atendeEducacaoEspecializada, forKey: "especializada")
        user.set(infra.temQuadraEsporteCoberta, forKey: "coberta")
        user.set(infra.temQuadraEsporteDescoberta, forKey: "descoberta")
        user.set(infra.temLaboratorioInformatica, forKey: "informatica")
        user.set(infra.temLaboratorioCiencias, forKey: "ciencias")
        user.set(infra.temParqueInfantil, forKey: "parqueInfantil")
        user.set(infra.temBiblioteca, forKey: "biblioteca")
        user.set(infra.temAreaVerde, forKey: "areaVerde")
        user.set(infra.temBercario, forKey: "bercario")
        user.set(infra.temAcessibilidade, forKey: "acessibilidade")
        user.set(infra.temCreche, forKey: "creche")
        user.set(infra.ofereceAlimentacao, forKey: "alimentacao")
    }
    
    func getInfra() -> (String?, Infraestutura) {
        
        let rede = user.string(forKey: "rede")
        let infra = Infraestutura()
        
        infra.temEnsinoFundamental = user.string(forKey: "fundamental")
        infra.temEnsinoMedio = user.string(forKey: "medio")
        infra.temEnsinoMedioProfissional = user.string(forKey: "profissionalizante")
        infra.temEnsinoMedioIntegrado = user.string(forKey: "integrado")
        infra.temEducacaoJovemAdulto = user.string(forKey: "jovemAdulto")
        infra.temEducacaoIndigena = user.string(forKey: "indigena")
        infra.atendeEducacaoEspecializada = user.string(forKey: "especializada")
        infra.temQuadraEsporteCoberta = user.string(forKey: "coberta")
        infra.temQuadraEsporteDescoberta = user.string(forKey: "descoberta")
        infra.temLaboratorioInformatica = user.string(forKey: "informatica")
        infra.temLaboratorioCiencias = user.string(forKey: "ciencias")
        infra.temParqueInfantil = user.string(forKey: "parqueInfantil")
        infra.temBiblioteca = user.string(forKey: "biblioteca")
        infra.temAreaVerde = user.string(forKey: "areaVerde")
        infra.temBercario = user.string(forKey: "bercario")
        infra.temAcessibilidade = user.string(forKey: "acessibilidade")
        infra.temCreche = user.string(forKey: "creche")
        infra.ofereceAlimentacao = user.string(forKey: "alimentacao")
        
        return (rede, infra)
    }
    
}

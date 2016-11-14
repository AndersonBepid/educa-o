//
//  EstadoStore.swift
//  tableview02
//
//  Created by Vilar da Camara Neto on 16-04-11.
//  Copyright © 2016 Vilar da Camara Neto. All rights reserved.
//

import UIKit
import CoreData

class EstadoStore: NSObject {
    static let singleton = EstadoStore()

    private var items: [Estado] = []

    private override init() {
        super.init()
    }

//    private func sortEstados() {
//        self.items.sortInPlace { (a, b) -> Bool in
//            return a.nome?.localizedCaseInsensitiveCompare(b.nome!) == .OrderedAscending
//        }
//    }

    func getAllEstados() -> [Estado] {
        
        self.items = self.resetDatabase()
        
        return self.items
    }

    func getByUF(nome: String) -> Estado? {
        
        for estado in self.items {
            if estado.nome! == nome {
                return estado
            }
        }
        return nil
    }

    func filterBy(searchText: String) -> [Estado] {
        
        if searchText == "" {
            return self.items
        }

        var estados: [Estado] = []

        for estado in self.items {
            if estado.nome!.localizedCaseInsensitiveContains(searchText) {
                estados.append(estado)
            }
        }

        return estados
        
        /*if searchText == "" {
            return self.getAllEstados()
        }
        
        let fetchRequest = NSFetchRequest(entityName: "Estado")
        let sortDescriptor = NSSortDescriptor (key: "nome", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.predicate = NSPredicate(format: "nome CONTAINS[cd] %@", searchText)
        
        do{
            return try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [Estado]
        }catch{
            print("Error fetching record: \(error)")
            return []
        }*/
    }

    func resetDatabase() -> [Estado]{
        
        var estados : [Estado] = []
        
        
        let dadosDosEstados = [
            ("Acre", #imageLiteral(resourceName: "AC")),
            ("Alagoas", #imageLiteral(resourceName: "AL")),
            ("Amapá", #imageLiteral(resourceName: "AP")),
            ("Amazonas", #imageLiteral(resourceName: "AM")),
            ("Bahia", #imageLiteral(resourceName: "BA")),
            ("Ceará", #imageLiteral(resourceName: "CE")),
            ("Distrito Federal", #imageLiteral(resourceName: "DF")),
            ("Espírito Santo", #imageLiteral(resourceName: "ES")),
            ("Goiás", #imageLiteral(resourceName: "GO")),
            ("Maranhão", #imageLiteral(resourceName: "MA")),
            ("Mato Grosso", #imageLiteral(resourceName: "MT")),
            ("Mato Grosso do Sul", #imageLiteral(resourceName: "MS")),
            ("Minas Gerais", #imageLiteral(resourceName: "MG")),
            ("Pará", #imageLiteral(resourceName: "PA")),
            ("Paraíba", #imageLiteral(resourceName: "PB")),
            ("Paraná", #imageLiteral(resourceName: "PR")),
            ("Pernambuco", #imageLiteral(resourceName: "PE")),
            ("Piauí", #imageLiteral(resourceName: "PI")),
            ("Rio de Janeiro", #imageLiteral(resourceName: "RJ")),
            ("Rio Grande do Norte", #imageLiteral(resourceName: "RN")),
            ("Rio Grande do Sul", #imageLiteral(resourceName: "RS")),
            ("Rondônia", #imageLiteral(resourceName: "RO")),
            ("Roraima", #imageLiteral(resourceName: "RR")),
            ("Santa Catarina", #imageLiteral(resourceName: "SC")),
            ("São Paulo", #imageLiteral(resourceName: "SP")),
            ("Sergipe", #imageLiteral(resourceName: "SE")),
            ("Tocantins", #imageLiteral(resourceName: "TO")),
            ]

        for dadosDoEstado in dadosDosEstados {
            let estado = Estado()
            estado.nome = dadosDoEstado.0
            estado.bandeira = dadosDoEstado.1
            
            estados.append(estado)
        }
        
        return estados
    }
}

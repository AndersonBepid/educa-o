//
//  EnderecoStore.swift
//  Escolaqui
//
//  Created by Anderson Oliveira on 13/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class EnderecoStore: NSObject {

    static let singleton: EnderecoStore = EnderecoStore()
    let user = UserDefaults.standard
    
    /*func fetchGeocoder(_ endereco: Endereco, completion: @escaping (_ location: CLLocation?, _ error: Error?) -> Void) -> () {
        CLGeocoder().geocodeAddressString("\(endereco)"){ (placemarks, error) in
            if let location = placemarks?.first?.location {
                
                print("Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)")
                completion(location, nil)
            } else {
                completion(nil, error)
            }
        }
    }*/
    
    func saveEndereco(_ endereco: Endereco?) {
        guard let e = endereco else {
            return
        }
        self.user.set(e.descricao, forKey: "descricao")
        self.user.set(e.bairro, forKey: "bairro")
        self.user.set(e.municipio, forKey: "municipio")
        self.user.set(e.uf, forKey: "uf")
    }
    
    func getEndereco() -> Endereco? {
        
        guard let descricao = user.string(forKey: "descricao"), let bairro = user.string(forKey: "bairro"), let municipio = user.string(forKey: "municipio"), let uf = user.string(forKey: "uf") else {
            return nil
        }
        
        let endereco = Endereco()
        
        endereco.descricao = descricao
        endereco.bairro = bairro
        endereco.municipio = municipio
        endereco.uf = uf
        
        return endereco
    }
}

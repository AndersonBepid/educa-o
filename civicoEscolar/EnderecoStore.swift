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
    
    func saveEndereco(_ endereco: Endereco) {
        
        print("pre-fudeu")
        self.user.set(endereco.descricao, forKey: "descricao")
        self.user.set(endereco.bairro, forKey: "bairro")
        self.user.set(endereco.municipio, forKey: "municipio")
        self.user.set(endereco.uf, forKey: "uf")
        print("passou")
    }
    
    func getEndereco() -> Endereco? {
        
        let endereco = Endereco()
        
        endereco.descricao = user.string(forKey: "descricao")
        endereco.bairro = user.string(forKey: "bairro")
        endereco.municipio = user.string(forKey: "municipio")
        endereco.uf = user.string(forKey: "uf")
        
        return endereco
    }
}

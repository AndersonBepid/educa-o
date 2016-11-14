//
//  EscolaStore.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit
import CoreLocation

let cacheIDEB: NSCache<NSNumber, Ideb> = NSCache<NSNumber, Ideb>()

class EscolaStore: NSObject {

    static let singleton: EscolaStore = EscolaStore()
    let baseUrl: String = "http://mobile-aceite.tcu.gov.br:80/nossaEscolaRS/rest/escolas"
    
    private override init() {
        super.init()
    }
    
    func fetchEscola(_ endereco: Endereco, completion: @escaping (_ escolas: [Escola]?, _ error: Error?) -> Void) -> (){
        self.fetchGeocoder(endereco) {  (_ location: CLLocation?, _ error: Error?)  in
            
            guard let location = location else {
                completion(nil, error)
                return
            }
            
            let stringUrl = "\(self.baseUrl)/latitude/\(location.coordinate.latitude)/longitude/\(location.coordinate.longitude)/raio/2?quantidadeDeItens=0"
            
            guard let url = URL(string: stringUrl) else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print(error!)
                    completion(nil, error)
                    return
                }
                
                do {
                    var escolas: [Escola] = []
                    if let d = data, let dictionary = try JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [[String: Any]] {
                        for dic in dictionary {
                            let escola = Escola(dictionary: dic)
                            escolas.append(escola)
                        }
                    }
                    DispatchQueue.main.async {
                        completion(escolas, nil)
                    }
                } catch let error {
                    print(error)
                    completion(nil, error)
                }
            }.resume()
        }
    }
    
    func fetchGeocoder(_ endereco: Endereco, completion: @escaping (_ location: CLLocation?, _ error: Error?) -> Void) -> () {
        guard let descricao = endereco.descricao, let bairro = endereco.bairro, let municipio = endereco.municipio, let uf = endereco.uf else {
            completion(nil, NSError())
            return
        }
        let enderecoString = "\(descricao) \(bairro) \(municipio) \(uf)"
        CLGeocoder().geocodeAddressString("\(enderecoString)"){ (placemarks, error) in
            if let location = placemarks?.first?.location {
                
                print("Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)")
                completion(location, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchIdeb(_ codEscola: NSNumber, completion: @escaping (_ ideb: Ideb?, _ error: Error?) -> Void) -> () {
        
        if let nota = cacheIDEB.object(forKey: codEscola) {
            print("Pegou do cache!")
            completion(nota, nil)
            return
        }
        
        let stringUrl = "\(self.baseUrl)/\(codEscola)/avaliacoes/media"
        
        guard let url = URL(string: stringUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print(error!)
                completion(nil, error)
                return
            }
                DispatchQueue.main.async {
                    do {
                        if let d = data, let notaIdeb = try JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [String: Any] {
                            let notaIde : Ideb = Ideb(dic: notaIdeb)
                            cacheIDEB.setObject(notaIde, forKey: codEscola)
                            
                            print("Pegou da internet!", "inseriu na cache")
                            completion(notaIde, nil)
                        }
                    }catch let error {
                        print(error)
                        completion(nil, error)
                    }
                }
        }.resume()
    }
}

class Ideb: AnyObject {
    var media: Float?
    var reasonPhrase: String?
    
    init(dic: Dictionary<String, Any>) {
        self.media = dic["media"] as? Float
        self.reasonPhrase = dic["reasonPhrase"] as? String
    }
}

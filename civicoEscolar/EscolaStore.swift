//
//  EscolaStore.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit
import CoreLocation

class EscolaStore: NSObject {

    static let singleton: EscolaStore = EscolaStore()
    let baseUrl: String = "http://mobile-aceite.tcu.gov.br:80/nossaEscolaRS/rest/escolas"
    
    private override init() {
        super.init()
    }
    
    func fetchEscola(_ endereco: Endereco, completion: @escaping (_ escolas: [Escola]?, _ error: Error?) -> Void) -> (){
        //-3.029961, -59.979305
        //-3.117034, -60.025780 - original
//        let lat = -3.029961
//        let long = -59.979305
        
        self.fetchGeocoder(endereco) {  (_ location: CLLocation?, _ error: Error?)  in
            
            guard let location = location else {
                completion(nil, error)
                return
            }
            
            let stringUrl = "\(self.baseUrl)/latitude/\(location.coordinate.latitude)/longitude/\(location.coordinate.longitude)/raio/1?quantidadeDeItens=0"
            
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
        CLGeocoder().geocodeAddressString("\(endereco)"){ (placemarks, error) in
            if let location = placemarks?.first?.location {
                
                print("Lat: \(location.coordinate.latitude) Long: \(location.coordinate.longitude)")
                completion(location, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchIdeb(_ codEscola: NSNumber?, completion: @escaping (_ ideb: Float?, _ error: Error?) -> Void) -> () {
        
        let stringUrl = "\(self.baseUrl)/\(codEscola!)/avaliacoes/media"
        
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
                
                if let d = data, let nota = try JSONSerialization.jsonObject(with: d, options: .allowFragments) as? [String: AnyObject] {
                    
                    if let media = nota["media"] as? Float {
                        print("\(codEscola!) = \(media)")
                    }else {
                        print("\(codEscola!) = \(nota["reasonPhrase"] as? String)reasonPhrase")
                    }
                    
                    
                    DispatchQueue.main.async {
                        completion(nota["media"] as? Float, nil)
                    }
                }
            }catch let error {
                
                print(error)
                completion(nil, error)
            }
        }.resume()
    }
}

//
//  EscolaStore.swift
//  civicoEscolar
//
//  Created by Thiago Vinhote on 02/11/16.
//  Copyright © 2016 Thiago Vinhote. All rights reserved.
//

import UIKit

class EscolaStore: NSObject {

    static let singleton: EscolaStore = EscolaStore()
    let baseUrl: String = "http://mobile-aceite.tcu.gov.br:80/nossaEscolaRS"
    
    private override init() {
        super.init()
    }
    
    func fetchEscola(completion: @escaping (_ escolas: [Escola]?, _ error: Error?) -> Void) -> (){
        //-3.029961, -59.979305
        //-3.117034, -60.025780 - original
        let lat = -3.029961
        let long = -59.979305
        let stringUrl = "\(self.baseUrl)/rest/escolas/latitude/\(lat)/longitude/\(long)/raio/1?quantidadeDeItens=0"
        guard let url = URL(string: stringUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print(error)
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
            }
        }.resume()
    }
    
}

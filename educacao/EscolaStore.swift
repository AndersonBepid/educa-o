//
//  EscolaStore.swift
//  educacao
//
//  Created by Anderson Oliveira on 29/10/16.
//  Copyright © 2016 Anderson Oliveira. All rights reserved.
//

import UIKit

class EscolaStore {
    
    static let singleton = EscolaStore()

    let urlP = "http://mobile-aceite.tcu.gov.br:80/nossaEscolaRS/"
    
    func getEscolasCidade(uf: String, cidade: String, completion: @escaping (_ escolas: [Escola]) -> Void) {
        guard let url = NSURL(string: "\(self.urlP)rest/escolas?municipio=\(cidade)&uf=\(uf)&quantidadeDeItens=100&api_key=rest/escolas") else {
            return
        }
        
        URLSession.shared.dataTask(with: url as URL) { data, response, error in
                var escolasCidade = [Escola]()
                do {
                    if let dados = data, let json = try JSONSerialization.jsonObject(with: dados, options: .allowFragments) as? [[String: AnyObject]] {
                        //print(json)
                        json.forEach({ (dicionary: [String : AnyObject]) in
                            let escolaCidade = Escola(dicionary)
                            escolasCidade.append(escolaCidade)
                        })
                        DispatchQueue.main.async {
                            completion(escolasCidade)
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
        }.resume()
    }
}

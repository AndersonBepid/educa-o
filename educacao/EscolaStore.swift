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
    
    func getEscolasCidade(uf: String, cidade: String) {
        
        let url = NSURL(string: "\(self.urlP)rest/escolas?municipio=\(cidade)&uf=\(uf)&quantidadeDeItens=20&api_key=rest/escolas")
        let task = URLSession.shared.dataTask(with: url! as URL) {
            data, response, error in
            
            DispatchQueue.main.async {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: Any]]
                                        
                    print("===json start")
                    for i in 0..<json.count{
                        let endereco = json[i]["endereco"] as? [String: Any]
                        print(endereco?["bairro"])
                    }
                    print("===json end")
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "update"), object: nil)
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        
    }
}

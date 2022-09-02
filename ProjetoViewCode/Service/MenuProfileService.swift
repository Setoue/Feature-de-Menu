//
//  MenuProfileService.swift
//  ProjetoViewCode
//
//  Created by user on 01/09/22.
//

import UIKit
import Alamofire

protocol MenuProfileServiceDelegate: GenerecService{
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>)
}

class MenuProfileService: MenuProfileServiceDelegate {
    
    //MOCK
    func getMenuFromJson(completion: @escaping completion<MenuProfileGroup?>) {
        
        if let url = Bundle.main.url(forResource: "menuProfile", withExtension: "json"){
            
            do{
                let data = try Data(contentsOf: url) //criação do data, no caso o caminho da arquivo json
                let menu: MenuProfileGroup = try JSONDecoder().decode(MenuProfileGroup.self, from: data)//menu vai receber os dados do json e inserir eles no objeto MenuProfileGroup
                completion(menu, nil)//retornado os valores através dos parametros do completion
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "menuProfile", error))
                //caso dê errado, ele passa os dados como nil e informa o erro passado da forma que foi passado no Enum
            }
        }
    }
}

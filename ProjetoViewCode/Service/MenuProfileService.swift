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
    func getMenu(completion: @escaping completion<MenuProfileGroup?>)
}

class MenuProfileService: MenuProfileServiceDelegate {
    
    //Função que faz a requisição na API
    func getMenu(completion: @escaping completion<MenuProfileGroup?>){
        
        let url: String = "https://run.mocky.io/v3/42056070-3f15-46cc-803c-eea994c546bb"
        
        AF.request(url, method: .get).validate().responseDecodable(of: MenuProfileGroup.self) { response in
            print(#function)
            debugPrint(response)//mostra todo o conteudo do objeto
            
            switch response.result{
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
                
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
                
            }
        }
        
    }//
    
    //Função que chama o MOCK pelo arquivo JSON
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

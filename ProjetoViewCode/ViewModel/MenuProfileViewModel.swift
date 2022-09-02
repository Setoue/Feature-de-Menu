//
//  MenuProfileViewModel.swift
//  ProjetoViewCode
//
//  Created by user on 01/09/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(typeFetch: TypeFetch) {
        
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { sucess, error in
                print(sucess)
            }
        case .request:
            break
        }
    }
}

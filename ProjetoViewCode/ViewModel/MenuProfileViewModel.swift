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
            self.service.getMenuFromJson { success, error in
                print(success)
            }
        case .request:
            self.service.getMenu { success, error in
//                print(success)
                print("SUCCESS -> \n \(success)")
                print("ERROR -> \n \(error)")
            }
        }
    }
}

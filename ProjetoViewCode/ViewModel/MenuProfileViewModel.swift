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

protocol MenuProfileViewModelDelegate: AnyObject{
    func success()
    func error(message: String)
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    
    public func delegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(typeFetch: TypeFetch) {
        
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.delegate?.success()
                } else {
                    self.delegate?.error(message: error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { success, error in
                if let success = success {
                    self.delegate?.success()
                } else {
                    self.delegate?.error(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
}

//
//  GenericService.swift
//  ProjetoViewCode
//
//  Created by user on 02/09/22.
//

import Foundation

protocol GenerecService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
    //complition generica com parametros genéricos retornando um void
}

enum Error: Swift.Error {
    case fileNotFound(name: String) //arquivo não encontrado
    case fileDecodingFailed(name: String, Swift.Error) //arquivo não serializado
}

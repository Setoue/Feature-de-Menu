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

enum TypeHiddenSection{
    case remove
    case insert
}

protocol MenuProfileViewModelDelegate: AnyObject{
    func success()
    func error(message: String)
}

class MenuProfileViewModel {
    
    private let service: MenuProfileService = MenuProfileService()
    private weak var delegate: MenuProfileViewModelDelegate?
    private var data: [Menu] = []
    private var hiddenInSection = Set<Int>()
    
    public func delegate(delegate: MenuProfileViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(typeFetch: TypeFetch) {
        
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.hiddenAllSection()
                    self.delegate?.success()
                    
                } else {
                    self.delegate?.error(message: error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.service.getMenu { success, error in
                if let success = success {
                    self.data = success.group ?? []
                    self.hiddenAllSection()
                    self.delegate?.success()
                    
                } else {
                    self.delegate?.error(message: error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfSection: Int { //retorna a quantidade de section existente
        return self.data.count
    }
    
    public func titleForSection(section: Int) -> String { //retorna o titulo de cada section
        return self.data[section].title ?? ""
    }
    
    public func titleCell(indexPath: IndexPath) -> String{ //retorna do titulo de cada cell
        return self.data[indexPath.section].child?[indexPath.row].title ?? ""
    }
    
    public func constainsSection(_ section: Int) -> Bool{ //manda a section fechar seu campo, caso ele esteja aberta
        return self.hiddenInSection.contains(section)
    }
    
    public func tappedSection(type: TypeHiddenSection, section: Int){ //retorna se a section clicada ou não
        if type == .insert {
            self.hiddenInSection.insert(section)
        } else {
            self.hiddenInSection.remove(section)
        }
    }
    
    public func indexPathForSection(section: Int) -> [IndexPath]{ //retorna um array de indexPath(a posição de cada section) para determinar o tamanho da section
        var indexPath = [IndexPath]()
        let size = self.childCount(section: section)
        for row in 0..<size{
            indexPath.append(IndexPath(row: row, section: section))
        }
        return indexPath
    }
    
    private func childCount(section: Int) -> Int{ // retorna a quantidade de child(de cell) que tem dentro de uma section
        return self.data[section].child?.count ?? 0
    }
    
    public func numberOfRowsInSection(section: Int) -> Int { //valida de a section está com o campo aberto ou fechado
        if self.constainsSection(section){
            return 0
        } else {
            return self.childCount(section: section)
        }
    }
    
    private func hiddenAllSection(){ //esconde as todas as section
        let size = self.numberOfSection
        for index in 0..<size {
            self.hiddenInSection.insert(index)
        }
    }
    
    
}

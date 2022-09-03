//
//  ViewController.swift
//  ProjetoViewCode
//
//  Created by user on 01/09/22.
//

import UIKit

class MenuProfileViewController: UIViewController {

    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .green
        viewModel.delegate(delegate: self)
        viewModel.fetch(typeFetch: .request)
    }
}

extension MenuProfileViewController: MenuProfileViewModelDelegate {
    
    func success() {
        print("Deu certo")
    }
    
    func error(message: String) {
        print("Deu ruim: \(message)")
    }
}


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
        viewModel.fetch(typeFetch: .mock)
    }
}


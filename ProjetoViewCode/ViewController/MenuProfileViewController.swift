//
//  ViewController.swift
//  ProjetoViewCode
//
//  Created by user on 01/09/22.
//

import UIKit

class MenuProfileViewController: UIViewController {

    var screen: MenuProfileScreen?
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    
    //MARK: - Life Cycle
    
    //o loadView ele instancia um view, para que agt consiga referenciar, dizendo que a MenuProfileViewController seja igual a MenuProfileScreen
    override func loadView() {
        self.screen = MenuProfileScreen()
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.view = self.screen
        
    }
    
    override func viewWillAppear(_ animated: Bool) {//carrega as 
        self.navigationController?.isNavigationBarHidden = true //Esconde a navigationController da tela
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

extension MenuProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
}

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
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(message: String) {
        print("Deu ruim: \(message)")
    }
    
    @objc func tapSection(_ sender: UIButton) {
        let section = sender.tag
        if self.viewModel.constainsSection(section){
            self.viewModel.tappedSection(type: .remove, section: section)
            self.screen?.insertRowsTableView(indexPath: self.viewModel.indexPathForSection(section: section), section: section)
        } else {
            self.viewModel.tappedSection(type: .insert, section: section)
            self.screen?.deleteRowsTableView(indexPath: self.viewModel.indexPathForSection(section: section), section: section)
        }
    }
}

extension MenuProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(self.tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: self.viewModel.titleForSection(section: section))
        view.expandButton(value: self.viewModel.constainsSection(section))
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuProfileTableViewCell.identifier, for: indexPath) as? MenuProfileTableViewCell
        cell?.setUpCell(title: viewModel.titleCell(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
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

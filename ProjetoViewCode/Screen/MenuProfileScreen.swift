//
//  MenuProfileScreen.swift
//  ProjetoViewCode
//
//  Created by user on 05/09/22.
//

import UIKit

class MenuProfileScreen: UIView {

    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false//é um valor boolean que diz se a view vai ter o autolayout
        view.backgroundColor = .purple
        return view
    }()
    
    lazy var upArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(self.tappedBack), for: .touchUpInside)
        return button
    }()
    
    lazy var tileLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Menu"
        return label
    }()
    
    @objc func tappedBack(_ sender: UIButton){
        print(#function)
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        //TO DO: Register
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .purple
        self.headerView.addSubview(self.upArrowButton)
        self.headerView.addSubview(self.tileLable)
        self.addSubview(self.headerView)
        self.addSubview(self.tableView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupDelegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            //posição da headerView
            self.headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 40),
            
            //posição do botão
            self.upArrowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.upArrowButton.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor),
            
            //posição da label
            self.tileLable.leadingAnchor.constraint(equalTo: self.upArrowButton.trailingAnchor, constant: 20),
            self.tileLable.centerYAnchor.constraint(equalTo: self.upArrowButton.centerYAnchor),
            
            //posição da tableView
            self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}

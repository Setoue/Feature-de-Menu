//
//  MenuProfileTableViewCell.swift
//  ProjetoViewCode
//
//  Created by user on 09/09/22.
//

import UIKit

class MenuProfileTableViewCell: UITableViewCell {

    static let identifier: String = "MenuProfileTableViewCell" //serve pra dar um identificador para a class, lembrar de registrar o identifier na screen principal, o identifier tem que ter o mesmo nome do file
    
    let screen: MenuProfileTableViewCellScreen = MenuProfileTableViewCellScreen()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
        self.configContraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUpCell(title: String) {
        self.screen.titleLabel.text = title
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
        
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor),
        ])
    }
    
}

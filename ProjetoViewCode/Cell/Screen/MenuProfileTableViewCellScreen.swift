//
//  MenuProfileTableViewCellScreen.swift
//  ProjetoViewCode
//
//  Created by user on 09/09/22.
//

import UIKit

class MenuProfileTableViewCellScreen: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var lineView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //primeiro passo é criar um init frame, junto com o required
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray.withAlphaComponent(0.9)
        addSubview(self.titleLabel)
        addSubview(self.lineView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            //titleLabel
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            
            //lineView
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }
    
}

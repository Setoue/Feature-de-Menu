//
//  MenuProfile.swift
//  ProjetoViewCode
//
//  Created by user on 01/09/22.
//

import Foundation

// MARK: - MeuProfileGroup
struct MenuProfileGroup: Codable {
    let group: [Menu]
}

// MARK: - Menu
struct Menu: Codable {
    let title: String
    let child: [Item]
}

// MARK: - Item
struct Item: Codable {
    let title: String
}

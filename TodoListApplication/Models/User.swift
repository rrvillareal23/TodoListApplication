//
//  User.swift
//  TodoList
//
//  Created by Ricky Villareal on 5/6/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

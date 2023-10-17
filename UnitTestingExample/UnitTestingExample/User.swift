//
//  User.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let email, username, password: String
    let phone: String
}

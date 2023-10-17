//
//  FeatureAError.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

enum FeatureAError: Error {
    case generic
    case invalidUrl
    case decodeFailed
    
    var message: String {
        switch self {
        case .generic:
            return "generic"
        case .invalidUrl:
            return "invalidUrl"
        case .decodeFailed:
            return "decodeFailed"
        }
    }
}

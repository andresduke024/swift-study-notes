//
//  FeatureAViewModelProtocol.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

protocol FeatureAViewModelProtocol {
    func getDataAsync() async
    
    func getDataClosure()
    
    func setBinding(_ binding: FeatureAViewModelBinding)
}

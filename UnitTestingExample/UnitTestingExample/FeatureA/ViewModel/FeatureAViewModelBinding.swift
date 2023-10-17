//
//  FeatureAViewModelBinding.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation

protocol FeatureAViewModelBinding: AnyObject {
    func dataLoaded(_ data: [FeatureAModel])
    
    func errorOnDataLoad(_ error: FeatureAError)
}

//
//  FeatureAViewController.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import Foundation
import UIKit

final class FeatureAViewController: UIViewController {
    
    private let viewModel: FeatureAViewModelProtocol
    
    init(viewModel: FeatureAViewModel = FeatureAViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        loadData()
    }
    
    private func setup() {
        viewModel.setBinding(self)
        view.backgroundColor = .cyan
    }
    
    private func loadData() {
        viewModel.getDataClosure()
        
        Task { await viewModel.getDataAsync() }
    }
}

extension FeatureAViewController: FeatureAViewModelBinding {
    func dataLoaded(_ data: [FeatureAModel]) {
        DispatchQueue.main.async {
            print("\n:::::::: DATA ::::::::")
            data.forEach { print($0.title ?? "") }
            print("::::::::::::::::::::::::::::\n")
        }
    }
    
    func errorOnDataLoad(_ error: FeatureAError) {
        DispatchQueue.main.async {
            print("\n:::::::: Error ::::::::")
            print(error.message)
            print("::::::::::::::::::::::::::::\n")
        }
    }
}

//
//  ViewController.swift
//  UnitTestingExample
//
//  Created by Andres Duque on 14/10/23.
//

import UIKit

class ViewController: UIViewController {

    var datasource: [User] = [] {
        didSet { datasource.forEach { print($0.username) } }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadUsers(_ sender: Any) {
        fetch { users, error in
            guard let users else {
                return
            }
            
            self.datasource = users
        }
    }
    
    private func fetch(completion: @escaping (_ users: [User]?, _ error: String?) -> Void) {
        guard let apiServiceUrl = URL(string: "https://fakestoreapi.com/users") else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: apiServiceUrl) { data, _, error in
            guard error == nil else {
                completion(nil, "Error on service request")
                return
            }
            
            guard let serviceData = data, let model = try? JSONDecoder().decode([User].self, from: serviceData) else {
                completion(nil, "Decode error")
                return
            }
            
            completion(model, nil)
        }
        .resume()
    }
    
    @IBAction func goToFeatureA(_ sender: Any) {
        let featureAViewController = FeatureAViewController()
        navigationController?.pushViewController(featureAViewController, animated: true)
    }
}


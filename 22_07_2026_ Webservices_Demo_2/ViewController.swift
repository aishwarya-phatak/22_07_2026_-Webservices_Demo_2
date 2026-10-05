//
//  ViewController.swift
//  22_07_2026_ Webservices_Demo_2
//
//  Created by Vishal Jagtap on 05/10/26.
//

import UIKit

class ViewController: UIViewController {
    
    var apiResponse : APIResponse?
    var comments : [Comment] = []

    var urlRequest : URLRequest?
    var urlSession : URLSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        jsonParsing()
    }
    
    func jsonParsing(){
        urlRequest = URLRequest(url: Constants.url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)
        
        let dataTask = urlSession?.dataTask(with: urlRequest!) { data, res, err in
            print("data : \(data)")
            print("response : \(res)")
            print("error : \(err)")
        }
        dataTask?.resume()
    }
}

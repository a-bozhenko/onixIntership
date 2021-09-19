//
//  ViewController.swift
//  OnixIntership
//
//  Created by Andrey Bozhenko on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {

    func sendGetRequest(url: String) -> Void {
        guard let url = URL(string: url) else {return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if let response = response {
                print(response);
            }
            
            guard let data = data else {return}
            
            print(data)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                
            } catch {
                print(error)
            }
        }.resume();
    }
    
    
    @IBAction func Button(_ sender: UIButton) {
    }
    
    @IBOutlet weak var TextArea: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


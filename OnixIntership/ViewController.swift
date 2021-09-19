//
//  ViewController.swift
//  OnixIntership
//
//  Created by Andrey Bozhenko on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextArea: UILabel!
    
    func sendGetRequest(url: String) -> Void {
        guard let url = URL(string: url) else {return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
       
        
        session.dataTask(with: url) { [self] data, response, error in
                       
            if let response = response {
                print(response);
            }
            
            guard let data = data else {return}
            
            do {
                let result = String(data: data, encoding: .utf8) ?? ""
                
                TextArea.text = result
                
                print(result)
            }
        }.resume();
    }
    
    
    @IBAction func Button(_ sender: UIButton) {
       let res = self.sendGetRequest(url: "http://numbersapi.com/random/year")
        
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


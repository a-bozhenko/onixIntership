//
//  ViewController.swift
//  OnixIntership
//
//  Created by Andrey Bozhenko on 19.09.2021.
//

import UIKit

class ViewController: UIViewController {
    var text = "text"
    
    
    @IBOutlet weak var TextArea: UILabel!
    
    func sendGetRequest(url: String) -> Void {
        guard let url = URL(string: url) else {return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
       let task = session.dataTask(with: url) { [] data, response, error in
            if let response = response {
                print(response);
            }
            
            guard let data = data else {return}
            
            do {
                let result = String(data: data, encoding: .utf8) ?? ""
                
                self.updateInMain(labelText: result)
            }
        }
        task.resume();
    }
    
    func updateInMain(labelText: String) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async{
                self.TextArea.text = labelText
            }
        }
    }
    
    @IBAction func Button(_ sender: UIButton) {
        self.sendGetRequest(url: "http://numbersapi.com/random/year")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}


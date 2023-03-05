//
//  ViewController.swift
//  F7
//
//  Created by Otakhon Toshpulatov on 05/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        func login(with username: String, password: String) {
           if username == "otabek" && password == "otaxon5550" {
              // Successful login, navigate to main screen
              let mainVC = storyboard?.instantiateViewController(identifier: "MainViewController") as! ViewController
              navigationController?.pushViewController(mainVC, animated: true)
           } else {
              // Invalid credentials, show error message
              let alert = UIAlertController(title: "Login Failed", message: "Invalid username or password", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              present(alert, animated: true, completion: nil)
           }
        }
    }
    
}


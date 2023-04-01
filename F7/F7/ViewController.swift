//
//  ViewController.swift
//  F7
//
//  Created by Otakhon Toshpulatov on 30/03/23.
//


import UIKit
import Foundation



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.let headers = [
        "X-RapidAPI-Key": "8bca79642emsh920ec95748c2827p17b142jsn03a3ee20edb8",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v3/countries?name=Uzbekistan&code=UZ&search=Uzbekistan")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        if (error != nil) {
            print(error)
        } else {
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse)
        }
    })

    dataTask.resume()


    }


}
import Foundation


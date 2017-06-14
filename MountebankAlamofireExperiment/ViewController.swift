//
//  ViewController.swift
//  MountebankAlamofireExperiment
//
//  Created by SangMee Specht on 6/13/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBAction func button(_ sender: Any) {
        
//'imposter' data
        let parameters: Parameters = [
            "port": 4545,
            "protocol": "http",
            "stubs": [
                [
                    "predicates": [
                        [
                            "equals": [
                                "method": "GET",
                                "path": "/data1"
                            ]
                        ]
                    ],
                    "responses": [
                        [
                            "is": [
                                "body": [ "this is data1" ],
                                "headers": [ "content-type": "application/json" ]
                            ]
                        ]
                    ]
                ],
                [
                    "predicates": [
                        [
                            "equals": [
                                "method": "GET",
                                "path": "/data2"
                            ]
                        ]
                    ],
                    "responses": [
                        [
                            "is": [
                                "body": [ "this is data2" ],
                                "headers": [ "content-type": "application/json" ]
                            ]
                        ]
                    ]
                ]
            ]
        ]
    
//sends POST request to upload 'imposter' to Mountebank
        Alamofire.request("http://localhost:2525/imposters/", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        
//sends GET request to retrieve 'imposter' for a particular path
        Alamofire.request("http://localhost:4545/data1").responseJSON { MBresponse in
            print(MBresponse)
        }
    }
}


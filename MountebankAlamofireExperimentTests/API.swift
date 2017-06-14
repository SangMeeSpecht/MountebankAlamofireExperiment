//
//  API.swift
//  MountebankAlamofireExperiment
//
//  Created by SangMee Specht on 6/13/17.
//  Copyright © 2017 SangMee Specht. All rights reserved.
//

import Quick
import Nimble
import Alamofire
import SwiftyJSON
@testable import MountebankAlamofireExperiment

class APISpec: QuickSpec {
    
    override func spec() {
        beforeSuite {
//    'setup' func to create POST request to create dummy data in Mountebank server
//            let parameters: JSON!
//            
//            do {
//                let path = Bundle.main.path(forResource: "Data", ofType: "JSON")!
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//                let parameterse = JSON(data: data as Data)
//            } catch {
//                print("unable to parse JSON file")
//            }
            
            let parameters: Parameters = [
                "port": 4545,
                "protocol": "http",
                "stubs": [[
                    "responses": [
                        [ "is": [ "statusCode": 400 ]]
                            ],
                            "predicates": [[
                            "and": [
                            [
                            "equals": [
                            "path": "/test1",
                            "method": "POST",
                            "headers": [ "Content-Type": "application/json" ]
                            ]
                            ],
                            [
                            "not": [
                            "contains": [ "body": "requiredField" ],
                            "caseSensitive": true
                            ]
                            ]
                            ]
                            ]]
                            ]]
                            ]
            
            Alamofire.request("http://localhost:2525/imposters", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        }
        
        describe("return JSON data") {
            it("returns the JSON data") {
                let response = Alamofire.request("http://localhost:2525/imposters/").responseJSON { response in
//                    print(response.)
                }
                
//                Alamofire.request("https://httpbin.org/get").responseJSON { response in
//                    debugPrint(response)
//                    
//                    if let json = response.result.value {
//                        print("JSON: \(json)")
//                    }
//                }
                
                
                expect(response).to(beNil())
            }
        }
        
        afterSuite {
//    'teardown' func to DELETE connection to server
        }
    }

}
//
//import Alamofire
//import Foundation
//import SwiftyJSON
//
//class API{
//    var url:String?
//    
//    func retrieveData(forPath path: String) -> JSON? {
//        do {
//            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//            let jsonObj = JSON(data: data as Data)
//            return jsonObj
//        } catch {
//            print("unable to parse JSON file")
//            return nil
//        }
//    }
//    
//    func findJSONfilePath(forPath : String) -> String {
//        return Bundle.main.path(forResource: forPath, ofType: "JSON")!
//    }
//    
//    func dummySearchRequestIfAPIExisted(forPath path:String)->JSON{
//        url = path
//        Alamofire.request(url!)
//            .responseJSON { response in
//                guard response.result.error == nil else {
//                    print("error calling GET on")
//                    print(response.result.error!)
//                    return
//                }
//                guard (response.result.value as? [String: Any]) != nil else {
//                    print("didn't get object as JSON from API")
//                    print("Error: \(response.result.error)")
//                    return
//                }
//        }
//        return JSON.null
//    }
//    
//    let parameters: Parameters = [
//        "port": 4545,
//        "protocol": "http",
//        "stubs": [
//            [
//              "responses": [[
//                  "is": [
//                      "body": [
//                            "code": "SUCCESS",
//                            "author": "J.K. Rowling"
//                        ]
//                    ]
//                    ]
//                ]]]]
//    
//    
//    func useData(){
//        Alamofire.request("http://localhost:2525/imposters", method: .post, parameters: parameters, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                print("//////RESPONSE//////", response)
//        }
//        
//        print("+++++++++++++++++++++")
//        Alamofire.request("http://localhost:2525/imposters/4545").responseJSON { response in
//            if let JSON = response.result.value {
//                print("GET RESPONSE VALUE: ", JSON)
//            } else {
//                print("NOT JSON")
//            }
//        }
//    }
//}
//

//
//  ViewController.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/01/26.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        print("ViewController::viewDidLoad()")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request : \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result  : \(String(describing: response.result))")

            if let json = response.result.value {
                print("JSON: \(json)")
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data : \(utf8Text))")
            }

        }
    }

    override func didReceiveMemoryWarning() {
        print("ViewController::didReceiveMemoryWarning()")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


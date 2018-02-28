//
//  ViewController.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/01/26.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        LogUtil.traceFunc()

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        AlamofireUtil.request() { (response) in
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
        LogUtil.traceFunc()

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


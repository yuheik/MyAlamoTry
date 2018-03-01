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

        HttpBinOrg.request() { (request, response, result, data)  in
            print("Request : \(String(describing: request))")
            print("Response: \(String(describing: response))")
            print("Result  : \(String(describing: result))")

            if let json = result.value {
                print("JSON: \(json)")
            }

            if let data = data, let utf8Text = String(data: data, encoding: .utf8) {
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


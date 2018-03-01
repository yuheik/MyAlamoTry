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

        HttpBinOrg.request(
            onSuccess: { (json) -> Void in
                LogUtil.traceFunc()
                print("args    : \(String(describing: json["args"]!))")
                print("headers : \(String(describing: json["headers"]!))")
                print("origin  : \(String(describing: json["origin"]!))")
                print("url     : \(String(describing: json["url"]!))")
            },
            onFailure: { (error) -> Void in
                LogUtil.traceFunc()
                // do nothing for now.
            }
        )
    }

    override func didReceiveMemoryWarning() {
        LogUtil.traceFunc()

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

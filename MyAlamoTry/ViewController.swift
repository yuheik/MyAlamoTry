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

        /*
        HttpBinOrg.request(
            onSuccess: { (data) -> Void in
                LogUtil.traceFunc()
                data.dump()
            },
            onFailure: { (error) -> Void in
                LogUtil.traceFunc()
                // do nothing for now.
            }
        )
        */

        DejizoUtil.request(
//            word: "house",
            word: "株",
            onSuccess: { (data) -> Void in
                LogUtil.traceFunc()
                data.dump()
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

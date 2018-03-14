//
//  ViewController.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/01/26.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        LogUtil.traceFunc()

        super.viewDidLoad()

        textField.delegate = self

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

    // MARK: textFied delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        LogUtil.traceFunc()

        // Hide the keyboard.
        textField.resignFirstResponder()

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        LogUtil.debug("what I get: \(textField.text)")
    }
}

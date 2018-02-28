//
//  AlamofireUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/02/28.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Alamofire

class AlamofireUtil {
    init() {}

    static func request() {
        Alamofire.request("https://httpbin.org/get").responseJSON { (response) -> Void in
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
}

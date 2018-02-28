//
//  AlamofireUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/02/28.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Alamofire

class AlamofireUtil {
    static func request(callback: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request("https://httpbin.org/get").responseJSON { (response) -> Void in
            callback(response)
        }
    }
}

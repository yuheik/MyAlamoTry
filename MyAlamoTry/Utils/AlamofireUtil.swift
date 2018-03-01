//
//  AlamofireUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/02/28.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Alamofire

protocol AlamofireUtil {
    static var url: String { get }

    static func request(callback: @escaping (URLRequest?, HTTPURLResponse?, Result<Any>, Data?) -> Void)
}

// MARK: HttpBinOrg:

class HttpBinOrg: AlamofireUtil {
    static var url = "https://httpbin.org/get"

    static func request(callback: @escaping (URLRequest?, HTTPURLResponse?, Result<Any>, Data?) -> Void) {
        Alamofire.request(url).responseJSON { (response) -> Void in
            callback(response.request,
                     response.response,
                     response.result,
                     response.data)
        }
    }
}

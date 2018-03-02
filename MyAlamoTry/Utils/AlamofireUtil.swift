//
//  AlamofireUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/02/28.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Alamofire

protocol AlamofireUtil {
    associatedtype T
    static var url: String { get }

    static func request(onSuccess: @escaping ([String:Any])  -> Void,
                        onFailure: @escaping (Error?) -> Void) -> Void
    static func parse(_ json: [String:Any]) -> T
}

extension AlamofireUtil {
    static func request(onSuccess: @escaping ([String:Any])    -> Void,
                        onFailure: @escaping (Error?) -> Void) -> Void {

        Alamofire.request(url).responseJSON { (response) -> Void in
            print("Response: \(String(describing: response))")
            if let value = response.result.value {
                print("Value: \(value)")
            }

            switch response.result {
            case .success:
//                onSuccess(response.result.value as! [String:Any])
                let _ = parse(response.result.value as! [String:Any])
            case .failure:
                onFailure(response.error)
            }
        }
    }
}



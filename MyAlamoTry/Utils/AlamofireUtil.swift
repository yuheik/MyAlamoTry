//
//  AlamofireUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/02/28.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Alamofire

protocol AlamofireUtil {
    associatedtype SpecificData

    static var url: String { get }

    static func request(onSuccess: @escaping (SpecificData) -> Void,
                        onFailure: @escaping (Error?)       -> Void) -> Void
    static func convertJsonToSpecific(_ json: [String:Any]) -> SpecificData
}

extension AlamofireUtil {
    static func request(onSuccess: @escaping (SpecificData) -> Void,
                        onFailure: @escaping (Error?)       -> Void) -> Void {

        Alamofire.request(url).responseJSON { (response) -> Void in
            print("Response: \(String(describing: response))")

            if let value = response.result.value {
                print("Value: \(value)")
            }

            if let data = response.data {
                print("Data: \(data)")
            }

            switch response.result {
            case .success:
                let resultInJson = response.result.value as! [String:Any]
                onSuccess(convertJsonToSpecific(resultInJson))
            case .failure:
                onFailure(response.error)
            }
        }
    }
}



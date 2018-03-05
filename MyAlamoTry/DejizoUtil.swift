//
//  HttpBinOrgUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/03/01.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Foundation
import Alamofire

/**
 * Wrapper of Dejizo Web Dictionary Service
 * https://www.est.co.jp/dev/dict/rest
 */
class DejizoUtil {
    static var urlSearchDictItem =
    "https://public.dejizo.jp/NetDicV09.asmx/SearchDicItemLite?" +
    "Dic=EJdict&" +
    "Word=house&" +
    "Scope=HEADWORD&" +
    "Match=EXACT&" +
    "Merge=OR&" +
    "Prof=XHTML&" +
    "PageSize=20&" +
    "PageIndex=0"

    static var urlGetDictItem = "https://public.dejizo.jp/NetDicV09.asmx/GetDicItemLite?" +
    "Dic=EJdict&" +
    "Item=019755&" +
    "Loc=&" +
    "Prof=XHTML"

    static func request(word: String,
                        onSuccess: @escaping (GetDictItemResult) -> Void,
                        onFailure: @escaping (Error?)       -> Void) -> Void {
        print("\(word): " + urlEncode(word))

        Alamofire.request(urlSearchDictItem).responseString { (response) -> Void in
            print("Response: \(String(describing: response))")
            if (response.result.isFailure) {
                LogUtil.debug("request failed")
                return
            }

            print("1st step success!!\n\n")

            Alamofire.request(urlGetDictItem).responseString { (response) -> Void in
                print("Response: \(String(describing: response))")
                if (response.result.isFailure) {
                    LogUtil.debug("request failed")
                    return
                }

                print("2nd step success as well!!\n\n")
            }
        }
    }

    static func urlEncode(_ str: String) -> String {
        return str.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
}

class SearchItemResult {
    var errorMessage  :String = ""
    var totalHitCount :Int = 0
    var itemCount :Int = 0
    var titleList :[DictItemTitle] = []

    func dump() {
        LogUtil.debug("this is dummy data")
    }
}

class DictItemTitle {
    var itemID :String = ""
    var locID  :String = ""
    var title  :String = ""
}

class GetDictItemResult {
    var errorMessage :String = ""
    var head :String = ""
    var body :String = ""

    func dump() {
        LogUtil.debug("dummy")
    }
}

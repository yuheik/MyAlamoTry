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
class DejizoUtil : NSObject, XMLParserDelegate {
    let urlSearchDictItem =
    "https://public.dejizo.jp/NetDicV09.asmx/SearchDicItemLite?" +
    "Dic=EJdict&" +
    "Word=%@&" +
    "Scope=HEADWORD&" +
    "Match=EXACT&" +
    "Merge=OR&" +
    "Prof=XHTML&" +
    "PageSize=20&" +
    "PageIndex=0"

    let urlGetDictItem = "https://public.dejizo.jp/NetDicV09.asmx/GetDicItemLite?" +
    "Dic=EJdict&" +
//    "Item=019755&" +
    "Item=004006&" +
    "Loc=&" +
    "Prof=XHTML"

    // MARK : XMLParserDelegate Implementation

    func parserDidStartDocument(_ parser: XMLParser) {
        LogUtil.traceFunc()
    }

    func parser(_ parser: XMLParser,
                didStartElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?,
                attributes attributeDict: [String : String] = [:]) {
        LogUtil.traceFunc(params: ["element name" : elementName])
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        LogUtil.traceFunc(params: ["found" : string])
    }

    func parser(_ parser: XMLParser,
                didEndElement elementName: String,
                namespaceURI: String?,
                qualifiedName qName: String?) {
        LogUtil.traceFunc(params: ["elementName" : elementName])
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        LogUtil.traceFunc()
    }

    // MARK : Main

    func request(word: String,
                        onSuccess: @escaping (GetDictItemResult) -> Void,
                        onFailure: @escaping (Error?)       -> Void) -> Void {
        print("\(word): " + urlEncode(word))

        let searchItem = String(format: urlSearchDictItem,
                                arguments: [urlEncode(word)])

        Alamofire.request(searchItem).responseString { (response) -> Void in
            print("Response: \(String(describing: response))")
            if (response.result.isFailure) {
                LogUtil.debug("request failed")
                return
            }

            guard let responseData = response.data else {
                print("1st step failed!!\n\n")
                return
            }
            print("1st step success!!\n\n")

            let xmlParser = XMLParser(data: responseData)

            print("1.5")
            xmlParser.delegate = self
            print("2.0")
            xmlParser.parse()
            print("2.5")




            Alamofire.request(self.urlGetDictItem).responseString { (response) -> Void in
                print("Response: \(String(describing: response))")
                if (response.result.isFailure) {
                    LogUtil.debug("request failed")
                    return
                }

                print("2nd step success as well!!\n\n")
            }
        }
    }

    func urlEncode(_ str: String) -> String {
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


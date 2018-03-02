//
//  HttpBinOrgUtil.swift
//  MyAlamoTry
//
//  Created by Yuhei Kikuchi on 2018/03/01.
//  Copyright © 2018 Yuhei Kikuchi. All rights reserved.
//

import Foundation

class HttpBinOrg: AlamofireUtil {
    static var url = "https://httpbin.org/get"

    typealias T = HttpBinOrgData

    static func parse(_ json: [String : Any]) -> HttpBinOrgData {
        let tmp = HttpBinOrgData.init(json)
        tmp.dump()
        return tmp
    }
}

class Headers {
    var accept         : String
    var acceptEncoding : String
    var acceptLanguage : String
    var connection     : String
    var host           : String
    var userAgent      : String

    init(_ json: [String:Any]) {
        accept         = json["Accept"]          as! String
        acceptEncoding = json["Accept-Encoding"] as! String
        acceptLanguage = json["Accept-Language"] as! String
        connection     = json["Connection"]      as! String
        host           = json["Host"]            as! String
        userAgent      = json["User-Agent"]      as! String
    }

    func dump() {
        LogUtil.debug("[Headers] >>")
        LogUtil.debug("accept         : \(accept)")
        LogUtil.debug("acceptEncoding : \(acceptEncoding)")
        LogUtil.debug("acceptLanguage : \(acceptLanguage)")
        LogUtil.debug("connection     : \(connection)")
        LogUtil.debug("host           : \(host)")
        LogUtil.debug("userAgent      : \(userAgent)")
        LogUtil.debug("<< [Headers]")
    }
}

class HttpBinOrgData {
    var args    : [String:Any]
    var headers : Headers
    var origin  : String
    var url     : String

    init(_ json: [String:Any]) {
        self.args    = json["args"]                  as! [String:Any]
        self.headers = Headers.init(json["headers"]! as! [String:Any])
        self.origin  = json["origin"]                as! String
        self.url     = json["url"]                   as! String
    }

    func dump() {
        LogUtil.debug("args   : \(args)")
        headers.dump()
        LogUtil.debug("origin : \(origin)")
        LogUtil.debug("url    : \(url)")
    }
}

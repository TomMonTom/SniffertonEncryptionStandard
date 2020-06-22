//
//  Extensions.swift
//  Snifferton
//
//  Created by THOMAS THOMPSON on 2/1/20.
//  Copyright © 2020 Thomas Thompson. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CommonCrypto
extension String {
    
    func sha256(salt: String) -> Data {
        return (self + salt).data(using: .utf8)!.sha256
    }
    
}

extension Data {
    
    var hexString: String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
    
    var sha256: Data {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        self.withUnsafeBytes({
            _ = CC_SHA256($0, CC_LONG(self.count), &digest)
        })
        return Data(digest)
    }
}
extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

private let q : Double = 4812983809852411904
func s(string:String) -> Data{
        let salt = string.sha256(salt: q.clean)
        return salt
}
extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

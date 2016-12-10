//
//  EncodableURL.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

extension URL: Encodable {

    public func encode() -> Encoder {
        return Encoder(encodedValue: absoluteString)
    }
}

extension NSURL: Encodable {

    public func encode() -> Encoder {
        guard let absoluteString = absoluteString else {
            return nil
        }
        return Encoder(encodedValue: absoluteString)
    }
}

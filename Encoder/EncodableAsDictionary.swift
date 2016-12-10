//
//  EncodableAsDictionary.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public protocol EncodableAsDictionary: Encodable, FailableEncodable {

    associatedtype Key

    associatedtype Value
}

public extension EncodableAsDictionary where Self: Sequence, Self.Iterator.Element == (key: Self.Key, value: Self.Value) {

    public func failableEncode() throws -> Any {
        var encoded: [String: Any] = [:]
        for (possibleKey, possibleValue) in self {
            guard let key = possibleKey as? String else {
                throw EncodableError.invalidKey(key: possibleKey)
            }
            guard let value = possibleValue as? Encodable else {
                throw EncodableError.invalidValue(value: possibleValue)
            }
            encoded[key] = value
        }
        return encoded
    }
}

extension Dictionary: EncodableAsDictionary { }
extension NSDictionary: EncodableAsDictionary { }

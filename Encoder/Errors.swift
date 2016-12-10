//
//  Errors.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public enum EncodableError: Error {
    case invalidKey(key: Any)
    case invalidValue(value: Any)
    case invalidValueType(type: Any.Type)
    case failedToSerializeObject(object: Any)
    case failedToParseDataString(data: Data)
    case customError(message: String)
    case wrappedError(error: Error)
}

extension EncodableError: CustomStringConvertible {

    public var description: String {
        switch self {
        case let .invalidKey(key):
            return "Encoding failed: found unsupported key '\(key)' in a dictionary"
        case let .invalidValue(value):
            return "Encoding failed: found unsupported value '\(value)'"
        case let .invalidValueType(type: type):
            return "Encoding failed: found unsupported value type '\(type)'"
        case let .failedToSerializeObject(object):
            return "Encoding failed: failed to serialize object '\(object)'"
        case let .failedToParseDataString(data):
            return "Encoding failed: failed to parse data string '\(data)'"
        case let .customError(message):
            return "Encoding failed: \(message)"
        case let .wrappedError(error):
            return "Encoding failed: \(error)"
        }
    }
}

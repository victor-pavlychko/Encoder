//
//  EncoderLiterals.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

extension Encoder: ExpressibleByNilLiteral {

    public init(nilLiteral: ()) {
        encodedValue = NSNull()
    }
}

extension Encoder: ExpressibleByBooleanLiteral {

    public init(booleanLiteral value: Bool) {
        encodedValue = value
    }
}

extension Encoder: ExpressibleByIntegerLiteral {

    public init(integerLiteral value: IntMax) {
        encodedValue = value
    }
}

extension Encoder: ExpressibleByFloatLiteral {

    public init(floatLiteral value: Double) {
        encodedValue = value
    }
}

extension Encoder: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        encodedValue = value
    }

    public init(unicodeScalarLiteral value: String) {
        encodedValue = value
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        encodedValue = value
    }
}

extension Encoder: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: Encodable?...) {
        let value: [Any] = elements.map { value in
            guard let value = value else {
                return NSNull()
            }
            return value.encode().encodedValue
        }
        encodedValue = value
    }
}

extension Encoder: ExpressibleByDictionaryLiteral {

    public init(dictionaryLiteral elements: (String, Encodable?)...) {
        var value: [String: Any] = [:]
        for (key, item) in elements {
            guard let item = item else {
                value[key] = NSNull()
                continue
            }
            value[key] = item.encode().encodedValue
        }
        encodedValue = value
    }
}

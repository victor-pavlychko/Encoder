//
//  EncodableAsArray.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public protocol EncodableAsArray: Encodable, FailableEncodable { }

public extension EncodableAsArray where Self: Sequence {

    public func failableEncode() throws -> Any {
        let encoded: [Any] = try map { possibleValue in
            guard let value = possibleValue as? Encodable else {
                throw EncodableError.invalidValue(value: possibleValue)
            }
            return value.encode().encodedValue
        }
        return encoded
    }
}

extension Array: EncodableAsArray { }
extension Set: EncodableAsArray { }
extension NSArray: EncodableAsArray { }
extension NSSet: EncodableAsArray { }

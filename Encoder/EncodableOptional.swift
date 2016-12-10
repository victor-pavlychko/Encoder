//
//  EncodableOptional.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/9/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

extension Optional: FailableEncodable {

    public func failableEncode() throws -> Any {
        guard Wrapped.self is Encodable.Type || Wrapped.self == Encodable.self else {
            throw EncodableError.invalidValueType(type: Wrapped.self)
        }
        switch self {
        case let .some(value as Encodable):
            return value.encode().encodedValue
        case let .some(value):
            throw EncodableError.invalidValue(value: value)
        case .none:
            return NSNull()
        }
    }
}

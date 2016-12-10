//
//  EncodableAsIdentity.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public protocol EncodableAsIdentity: Encodable { }

public extension EncodableAsIdentity {

    public func encode() -> Encoder {
        return Encoder(encodedValue: self)
    }
}

extension Bool: EncodableAsIdentity { }

extension Int: EncodableAsIdentity { }
extension Int8: EncodableAsIdentity { }
extension Int16: EncodableAsIdentity { }
extension Int32: EncodableAsIdentity { }
extension Int64: EncodableAsIdentity { }

extension UInt: EncodableAsIdentity { }
extension UInt8: EncodableAsIdentity { }
extension UInt16: EncodableAsIdentity { }
extension UInt32: EncodableAsIdentity { }
extension UInt64: EncodableAsIdentity { }

extension Float: EncodableAsIdentity { }
extension Double: EncodableAsIdentity { }

extension String: EncodableAsIdentity { }
extension StaticString: EncodableAsIdentity { }

extension NSNull: EncodableAsIdentity { }
extension NSNumber: EncodableAsIdentity { }
extension NSString: EncodableAsIdentity { }

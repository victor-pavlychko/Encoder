//
//  Encoder.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public struct Encoder {

    public let encodedValue: Any
}

public extension Encoder {

    public func toJSONData() throws -> Data {
        guard JSONSerialization.isValidJSONObject(encodedValue) else {
            throw EncodableError.failedToSerializeObject(object: encodedValue)
        }
        return try JSONSerialization.data(withJSONObject: encodedValue, options: [])
    }
    
    public func toJSONString() throws -> String {
        let jsonData = try toJSONData()
        guard let result = String(data: jsonData, encoding: .utf8) else {
            throw EncodableError.failedToParseDataString(data: jsonData)
        }
        return result
    }
}

public extension Encoder {
    
    public var asJSON: Any {
        return encodedValue
    }

    public var asJSONData: Data {
        do {
            return try toJSONData()
        } catch {
            fatalError()
        }
    }

    public var asJSONString: String {
        do {
            return try toJSONString()
        } catch {
            fatalError()
        }
   }
}

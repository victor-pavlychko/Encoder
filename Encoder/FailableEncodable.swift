//
//  FailableEncodable.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public protocol FailableEncodable: Encodable {

    func failableEncode() throws -> Any
}

public extension FailableEncodable {
    
    public func encode() -> Encoder {
        do {
            return Encoder(encodedValue: try failableEncode())
        } catch let error as EncodableError {
            fatalError(error.description)
        } catch let error {
            fatalError("Unexpected error: \(error)")
        }
    }
}

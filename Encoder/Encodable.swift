//
//  Encodable.swift
//  Encoder
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import Foundation

public protocol Encodable {

    func encode() -> Encoder
}

public extension Encodable where Self: RawRepresentable, Self.RawValue: Encodable {

    public func encode() -> Encoder {
        return rawValue.encode()
    }
}

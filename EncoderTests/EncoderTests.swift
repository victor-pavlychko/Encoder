//
//  EncoderTests.swift
//  EncoderTests
//
//  Created by Victor Pavlychko on 12/8/16.
//  Copyright © 2016 address.wtf. All rights reserved.
//

import XCTest
import Encoder

struct Box<T>: Encodable where T: Encodable {
    let value: T
    func encode() -> Encoder {
        return ["value": value]
    }
}

enum Gender: String, Encodable {
    case male = "Male"
    case female = "Female"
}

enum Day: Int, Encodable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

struct Person {
    let name: String
    let age: Int
    let height: Float
    let active: Bool
}

extension Person: Encodable {
    func encode() -> Encoder {
        return [
            "name": name,
            "age": age,
            "height": height,
            "active": active,
            "nothing": nil,
        ]
    }
}

struct Group {
    let members: [Person]
}

extension Group: Encodable {
    func encode() -> Encoder {
        return ["members": members]
    }
}

class EncoderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSimple() {
        XCTAssertEqual(Box(value: true).encode().asJSONString, "{\"value\":true}")
        XCTAssertEqual(Box(value: false).encode().asJSONString, "{\"value\":false}")
        XCTAssertEqual(Box(value: 123).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: -123).encode().asJSONString, "{\"value\":-123}")
        XCTAssertEqual(Box(value: 123.5).encode().asJSONString, "{\"value\":123.5}")
        XCTAssertEqual(Box(value: "test").encode().asJSONString, "{\"value\":\"test\"}")
    }

    func testIntegers() {
        XCTAssertEqual(Box(value: Int(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: Int8(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: Int16(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: Int32(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: Int64(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: Int(-123)).encode().asJSONString, "{\"value\":-123}")
        XCTAssertEqual(Box(value: Int8(-123)).encode().asJSONString, "{\"value\":-123}")
        XCTAssertEqual(Box(value: Int16(-123)).encode().asJSONString, "{\"value\":-123}")
        XCTAssertEqual(Box(value: Int32(-123)).encode().asJSONString, "{\"value\":-123}")
        XCTAssertEqual(Box(value: Int64(-123)).encode().asJSONString, "{\"value\":-123}")
    }
    
    func testUnsigned() {
        XCTAssertEqual(Box(value: UInt(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: UInt8(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: UInt16(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: UInt32(123)).encode().asJSONString, "{\"value\":123}")
        XCTAssertEqual(Box(value: UInt64(123)).encode().asJSONString, "{\"value\":123}")
    }
    
    func testStrings() {
        XCTAssertEqual(Box(value: String("test")).encode().asJSONString, "{\"value\":\"test\"}")
        XCTAssertEqual(Box(value: NSString(string: "test")).encode().asJSONString, "{\"value\":\"test\"}")
    }
    
    func testEnums() {
        XCTAssertEqual(Box(value: Gender.male).encode().asJSONString, "{\"value\":\"Male\"}")
        XCTAssertEqual(Box(value: Day.friday).encode().asJSONString, "{\"value\":5}")
    }
    
    func testArray() {
        XCTAssertEqual(Box(value: [1, 2, 3]).encode().asJSONString, "{\"value\":[1,2,3]}")
        XCTAssertEqual(Box(value: ["a", "b", "c"]).encode().asJSONString, "{\"value\":[\"a\",\"b\",\"c\"]}")
        XCTAssertEqual(Box(value: [nil, nil, nil] as [Int?]).encode().asJSONString, "{\"value\":[null,null,null]}")
    }
}

//
//  ArrayTests.swift
//  ApplicationBaseExtensionsTests
//
//  Created by Yuta Kawabe on 2018/01/15.
//  Copyright © 2018年 Yuta Kawabe. All rights reserved.
//

import XCTest
@testable import ApplicationBaseExtensions

class ArrayTests: XCTestCase {
    
    private var list: [String] = []
    
    override func setUp() {
        super.setUp()
        self.list = ["a", "b"]
    }
    
    
    func test_safe_normal() {
        XCTAssertEqual(self.list[safe: 0], "a")
        XCTAssertEqual(self.list[safe: 1], "b")
    }
    
    func test_safe_nil() {
        XCTAssertNil(self.list[safe: -1])
        XCTAssertNil(self.list[safe: 2])
    }
    
    func test_reverse() {
        XCTAssertEqual(self.list[reverse: 0], "b")
        XCTAssertEqual(self.list[reverse: 1], "a")
    }
    
    func test_multiply_normal() {
        XCTAssertEqual(self.list * 3, ["a", "b", "a", "b", "a", "b"])
    }
    
    func test_multiply_error() {
        XCTAssertEqual(self.list * 0, [])
    }
}

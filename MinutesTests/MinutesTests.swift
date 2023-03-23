//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Ramón Dias de Oliveira Almeida on 23/03/23.
//  Copyright © 2023 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

final class MinutesTests: XCTestCase {
    
    var entry: Entry!

    override func setUpWithError() throws {
        entry = Entry("Title", "Content")
    }

    override func tearDownWithError() throws {
        entry = nil
    }
    
    func test_Serialization() {
        let data = FileEntryStore.serialize(entry)
        let sut = FileEntryStore.deserialize(data!)
        
        XCTAssertEqual(sut?.title, "Title", "Title does not match")
        XCTAssertEqual(sut?.content, "Content", "Content does not match")
    }
}

//
//  panakiTests.swift
//  panakiTests
//
//  Created by IRASER on 2015/11/05.
//  Copyright © 2015年 Kazuma from IRASER. All rights reserved.
//

import XCTest
@testable import panaki

class panakiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        siritoritest()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func siritoritest() {
        let andrea = Andrea_higa()
        let andrea_word = Andrea_higa_word()
        var return_word = ""

        for var i = 0; i < 30; i++ {
            let lastchar = andrea_word.adjustChar(return_word)
            return_word = andrea.siritori(return_word)
            XCTAssertEqual(return_word.characters.first!, lastchar, "\(i)回目 失敗")
            print(return_word)
        }

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
}

//
//  WeakOwnerTests.swift
//  WeakOwnerTests
//
//  Created by luojie on 2017/10/2.
//  Copyright © 2017年 LuoJie. All rights reserved.
//

import XCTest
@testable import WeakOwner

class User {
    var name: String?
}

class WeakOwnerTests: XCTestCase {
    
    func testExample() {
        
        let user = User()
        
        let setUserName = weak(user) { (user, text: String) in
            user.name = text
        }
        
        setUserName("Luo Jie")
        
        XCTAssertEqual(user.name, "Luo Jie")
    }
    
    func testExample1() {
        
        var user: User? = User()
        
        weak var weakUser = user
        
        let setUserName = weak(user!) { (user, text: String) in
            user.name = text
        }
        
        user = nil
        
        setUserName("Luo Jie")
        
        XCTAssertEqual(weakUser?.name, "nil")
    }
}


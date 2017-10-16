//
//  MyData.swift
//  final
//
//  Created by Mark Hoath on 16/10/17.
//  Copyright © 2017 Mark Hoath. All rights reserved.
//

import Foundation

enum Mode {
    case add
    case edit
}

struct MyData {
    
    var name: String = ""
    var age: Int = 18
    var gender: Bool = false // false = male, true = female
}


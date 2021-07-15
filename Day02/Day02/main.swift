//
//  main.swift
//  Day02
//
//  Created by SeungYeon on 2021/07/15.
//

import Foundation

var str1: String

str1 = "Apple"
str1 = "Google"
//str1 = nil
print(str1)

var str2: String?

str2 = "Apple"
str2 = "Google"
str2 = "123"
//str2 = nil
print(str2!)
//print(str2)

var int1: Int = Int(str2!)!

print(int1 + 10)





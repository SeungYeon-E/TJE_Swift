//
//  DBModel.swift
//  ServerJson_01
//
//  Created by SeungYeon on 2021/07/27.
//

import Foundation

class DBModel: NSObject{
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    // Empty constructor
    override init() {
        
    }
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
        
    }
}

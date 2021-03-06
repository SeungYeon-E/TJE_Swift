//
//  UpdateModel.swift
//  DBCRUD
//
//  Created by SeungYeon on 2021/07/28.
//

import Foundation
//class JsonModel:NSObject{
class UpdateModel{
    var urlPath = "http://172.30.1.28:8080/ios/studentUpdate_ios.jsp"
    
    func updateItems(code: String, name: String, dept: String, phone: String) -> Bool{
        var result: Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSesstion = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSesstion.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to update data")
                result = false
            }else{
                print("Data is updated!")
                result = true
            }
            
        }
        task.resume()
        return result
    }
    
}

//
//  DeleteModel.swift
//  DBCRUD
//
//  Created by SeungYeon on 2021/07/28.
//

import Foundation
//class JsonModel:NSObject{
class DeleteModel{
    var urlPath = "http://192.168.2.9:8080/ios/studentDelete_ios.jsp"
    
    func deleteItems(code: String) -> Bool{
        var result: Bool = true
        let urlAdd = "?code=\(code)"
        urlPath = urlPath + urlAdd
        
        // 한글 url encoding
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url: URL = URL(string: urlPath)!
        let defaultSesstion = URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSesstion.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to delete data")
                result = false
            }else{
                print("Data is deleted!")
                result = true
            }
            
        }
        task.resume()
        return result
    }
    
}

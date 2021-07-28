//
//  JsonModel.swift
//  ServerJson_03
//
//  Created by SeungYeon on 2021/07/28.
//

import Foundation

//protocol JsonModelProtocol: class {
protocol JsonModelProtocol{
    func itemDownloaded(items: NSArray)
}

//class JsonModel:NSObject{
class JsonModel{
    var delegate: JsonModelProtocol!
    let urlPath = "http://172.30.1.28:8080/ios/student.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSesstion = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSesstion.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJSON(data!)
            }
            
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) {
        var jsonResult = NSArray()
        do {
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print(error)
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let scode = jsonElement["code"] as? String,
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                locations.add(query)
            }
        }
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaded(items: locations)
        })
    }
}

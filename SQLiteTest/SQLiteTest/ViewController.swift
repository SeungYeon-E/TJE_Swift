//
//  ViewController.swift
//  SQLiteTest
//
//  Created by SeungYeon on 2021/07/26.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    var db:OpaquePointer?
    let TABLE_NAME : String = "DaengDaengTable"
    
    @IBOutlet weak var tvResult: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createTable()
        
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        insert("댕댕이 미용", "오늘 솜사탕이 되었다.", "2021-07-25", "2021-07-26")
        
    }
    @IBAction func btnUpdate(_ sender: UIButton) {
        update("8", "되려나", "될걸?", "2021-07-18")
        
    }
    @IBAction func btnDelete(_ sender: UIButton) {
        delete("1", "2021-07-20")
        
    }
    @IBAction func btnSelete(_ sender: UIButton) {
        selectValue()
        
    }
    func createTable(){
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("DaengDaengDB.sqlite")
        // 파일 경로
        print(fileURL)
        
        if sqlite3_open(fileURL.path, &db) == SQLITE_OK {
            print("table not exsist")
        }
        
        //  title  , contents , targetDate ,submitDate , deleteDate
        let CREATE_QUERY_TEXT : String = "CREATE TABLE IF NOT EXISTS \(TABLE_NAME) (no INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, contents TEXT, targetDate TEXT NOT NULL, submitDate TEXT, deleteDate TEXT)"
        
        print(CREATE_QUERY_TEXT)
        if sqlite3_exec(db, CREATE_QUERY_TEXT, nil, nil, nil) != SQLITE_OK {
            let errMsg = String(cString:sqlite3_errmsg(db))
            print("db table create error : \(errMsg)")
        }
    }
    func insert(_ title : String,_ contents : String, _ targetDate : String, _ submitDate : String ){
        var stmt : OpaquePointer?
        
        let INSERT_QUERY_TEXT : String = "INSERT INTO \(TABLE_NAME) (title, contents, targetDate, submitDate) Values (?,?,?,?)"
        
        // 확인해야함!! update도 마찬가지
//         let title = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//         let contents = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//         let targetDate = tfTel.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if sqlite3_prepare(db, INSERT_QUERY_TEXT, -1, &stmt, nil) != SQLITE_OK {
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert:v1 \(errMsg)")
            return
        }
        
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        if sqlite3_bind_text(stmt, 1, title, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("failture binding name: \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, contents, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("failture binding name: \(errMsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 3, targetDate, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("failture binding name: \(errMsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, submitDate, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("failture binding name: \(errMsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("insert fail :: \(errMsg)")
            return
        }
    }
    func update(_ no:String, _ title : String,_ contents : String, _ targetDate : String){
        let UPDATE_QUERY = "UPDATE \(TABLE_NAME) Set title = '\(title)', contents = '\(contents)', targetDate= '\(targetDate)' WHERE no = \(no)"
        var stmt:OpaquePointer?
        print(UPDATE_QUERY)
        if sqlite3_prepare(db, UPDATE_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing update: v1\(errMsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("update fail :: \(errMsg)")
            return
        }
        
        sqlite3_finalize(stmt)
        print("update success")
        
    }
    func delete(_ no:String, _ deleteDate:String){
        let DELETE_QUERY = "UPDATE \(TABLE_NAME) Set deleteDate = '\(deleteDate)' WHERE no = \(no)"
        var stmt:OpaquePointer?
        
        print(DELETE_QUERY)
        if sqlite3_prepare_v2(db, DELETE_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing delete: v1\(errMsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errMsg = String(cString : sqlite3_errmsg(db)!)
            print("delete fail :: \(errMsg)")
            return
        }
        sqlite3_finalize(stmt)
        print("delete success")
    }
    func selectValue(){
        
        let SELECT_QUERY = "SELECT * FROM \(TABLE_NAME) WHERE deleteDate IS NULL"
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, SELECT_QUERY, -1, &stmt, nil) != SQLITE_OK{
            let errMsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: v1\(errMsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let no = sqlite3_column_int(stmt, 0)
            let title = String(cString: sqlite3_column_text(stmt, 1))
            let contents = String(cString: sqlite3_column_text(stmt, 2))
            let targetDate = String(cString: sqlite3_column_text(stmt, 3))
            let submitDate = String(cString: sqlite3_column_text(stmt, 4))
            print("read value no : \(no) title : \(title) contents : \(contents) targetDate : \(targetDate) submitDate : \(submitDate) ")
        }
    }
    
    
}


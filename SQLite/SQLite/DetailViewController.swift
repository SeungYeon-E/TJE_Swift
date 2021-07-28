//
//  DetailViewController.swift
//  SQLite
//
//  Created by SeungYeon on 2021/07/27.
//

import UIKit
import SQLite3

class DetailViewController: UIViewController {
    
    var db: OpaquePointer?

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfTel: UITextField!
    
    var receiveId = 0
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }

        // Do any additional setup after loading the view.
        tfId.text = String(receiveId)
        tfName.text = receiveName
        tfDept.text = receiveDept
        tfTel.text = receivePhone
        
    }
    
    func receiveItems(_ id: Int, _ name: String, _ dept: String, _ phone: String) {
        receiveId = id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
    }
//    sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)
    @IBAction func btnModify(_ sender: UIButton) {
        
        // 한글 깨짐 방지 *****
//        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        receiveName = (tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        receiveDept = (tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        receivePhone = (tfTel.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
        
        let UPDATE_QUERY = "UPDATE students Set sname = '\(receiveName)', sdept = '\(receiveDept)', sphone= '\(receivePhone)' WHERE sid = \(receiveId)"
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
        let resultAlert = UIAlertController(title: "결과", message: "수정 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        let DELETE_QUERY = "DELETE FROM students WHERE sid = \(receiveId)"
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
        let resultAlert = UIAlertController(title: "결과", message: "삭제 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

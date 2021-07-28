//
//  TableViewController.swift
//  SQLite
//
//  Created by SeungYeon on 2021/07/27.
//

import UIKit
import SQLite3

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    var db: OpaquePointer?
    var studentsList: [Students] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students(sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        // Temporary Insert
//        tempInsert()
        
        // DB내용 불러오기
        readValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        readValues()
        tvListView.reloadData()
    }
    
    
    func tempInsert() {
        var stmt: OpaquePointer?
        // 한글 깨짐 방지
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        
        if sqlite3_bind_text(stmt, 1, "유비", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        
        if sqlite3_bind_text(stmt, 2, "컴퓨터공학과", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding sdept: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        
        if sqlite3_bind_text(stmt, 3, "1234", -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding sphone: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting student: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        
        print("Strudnets saved successfully")
    }
    
    func readValues(){
        // 초기 작업 필요: 데이터 지워주기
        studentsList.removeAll()
        
        let queryString = "SELECT * FROM students"
        var stmt: OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            // 그냥 빠지는거야
            return
        }
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            print(id, name, phone)
            studentsList.append(Students(id: Int(id), name: String(name), dept: String(dept), phone: String(phone)))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let students: Students
        students = studentsList[indexPath.row]
        
        cell.textLabel?.text = "학번 : \(students.id)"
        cell.detailTextLabel?.text = "성명 : \(students.name!)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    // Table 셀 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let DELETE_QUERY = "DELETE FROM students WHERE sid = \(studentsList[indexPath.row].id)"
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
                self.studentsList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            })
            
            resultAlert.addAction(okAction)
            present(resultAlert, animated: true, completion: nil)
            
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail"{
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItems(studentsList[indexPath!.row].id, studentsList[indexPath!.row].name!, studentsList[indexPath!.row].dept!, studentsList[indexPath!.row].phone!)
        }
    }
    

}

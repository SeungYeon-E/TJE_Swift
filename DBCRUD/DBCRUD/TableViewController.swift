//
//  TableViewController.swift
//  DBCRUD
//
//  Created by SeungYeon on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let queryModel = QueryModel()
//        queryModel.delegate = self
//        queryModel.downloadItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        cell.textLabel!.text = "성명 : \(item.sname!)"
        cell.detailTextLabel!.text = "전화 : \(item.sphone!)"


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
                
                let item: DBModel = feedItem[indexPath.row] as! DBModel
                
                let deleteModel = DeleteModel()
                let result = deleteModel.deleteItems(code: item.scode!)
                
                if result{
                    let resultAlert = UIAlertController(title: "완료", message: "삭제가 되었습니다!", preferredStyle: .alert)
                    let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                        let item: NSMutableArray = self.feedItem[indexPath.row] as! NSMutableArray
                        item.removeAllObjects()
                        tableView.deleteRows(at: [indexPath], with: .fade)
                    })
                    resultAlert.addAction(onAction)
                    present(resultAlert, animated: true, completion: nil)
                }else{
                    let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다!", preferredStyle: .alert)
                    let onAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    resultAlert.addAction(onAction)
                    present(resultAlert, animated: true, completion: nil)
                }
                
                
                
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
            let indexPath = self.listTableView.indexPath(for: cell)
            
            let item: DBModel = feedItem[indexPath!.row] as! DBModel
            
            let detailView = segue.destination as! DetailViewController
                detailView.receiveItems(item.scode!, item.sname!, item.sdept!, item.sphone!)
                
        }
    }
}

extension TableViewController: QueryModelProtocol{
    func itemDownloaded(items: NSArray) {
        feedItem = items
        self.listTableView.reloadData()
    }
}

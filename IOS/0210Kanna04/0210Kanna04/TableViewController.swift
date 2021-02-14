//
//  TableViewController.swift
//  0210Kanna04
//
//  Created by YOUNG on 2021/02/10.
//

import UIKit

class TableViewController: UITableViewController, CrawlModelProtocol {
    @IBOutlet var listView: UITableView!
    var feedItem: NSArray = NSArray() // 배열로 들어온것 처리하는 변수
    var feedItemAddress: NSArray = NSArray()
    var year: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listView.delegate = self
        self.listView.dataSource = self
        
        let crawlModel = CrawlModel()
        crawlModel.delegate = self
        year = "2019"
        self.title = "Rotten Tomatoes \(year)"
        crawlModel.dataCrawling(year: year)
       
    }

    
    func itemDownLoaded(items: NSArray, itemsAddress: NSArray) {
        feedItem = items
        feedItemAddress = itemsAddress
        self.listView.reloadData()
    }
    
    
    
    
    @IBAction func btnYear(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "년도입력", message: "순위를 보고싶은 년도는?", preferredStyle: UIAlertController.Style.alert)
        let cancleAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.default, handler: nil)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: {ACTION in
            if let year = alert.textFields?.first?.text{
                self.title = "Rotten Tomatoes : \(year)"
                let crawlModel = CrawlModel()
                crawlModel.delegate = self
                crawlModel.dataCrawling(year: year)
            }
        })
        
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "년도 입력..."
        })
        
        alert.addAction(cancleAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
        let item: String = feedItem[indexPath.row] as! String // cell 구성.. feeditem의 갯수만큼 구성
        cell.textLabel?.text = "\(item)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        let cell = sender as! UITableViewCell
        let indexPath = self.listView.indexPath(for: cell)
        let detailView = segue.destination as! ViewController
        detailView.receiveItems = feedItemAddress[(indexPath! as NSIndexPath).row] as! String
    }
    

}

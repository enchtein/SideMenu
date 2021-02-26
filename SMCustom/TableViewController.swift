//
//  TableViewController.swift
//  SMCustom
//
//  Created by Track Ensure on 2021-02-25.
//

import UIKit

class TableViewController: UIViewController {
    let cellIdentifier = "cellIdentifier"
    @IBOutlet var tableView: UITableView!
    private let info = ["greenVC", "orangeVC", "redVC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        

        // Do any additional setup after loading the view.
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
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier)
        cell?.textLabel?.text = self.info[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.info[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: cell)
        vc?.title = cell
        
        let mainVC = storyboard?.instantiateViewController(withIdentifier: "mainVC") as! ViewController
        mainVC.toPresentVC = vc
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
}


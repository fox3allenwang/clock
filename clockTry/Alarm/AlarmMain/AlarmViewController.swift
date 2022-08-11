//
//  clockTry.swift
//  clockTry
//
//  Created by Hung-Ming Chen on 2022/6/30.
//

import UIKit
import RealmSwift
import SwiftUI

class AlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var AlarmTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationRightButton()
        registerCell()
        self.navigationItem.title = "鬧鐘"
    }
    
    func registerCell(){
        AlarmTableView.register(UINib(nibName: "AlarmTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        AlarmTableView.delegate = self
        AlarmTableView.dataSource = self
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AlarmTableViewCell
        return cell
    }
    
    func navigationRightButton(){
        let rightButton = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(addAlarm))
        
        rightButton.tintColor = .blue
        rightButton.image = UIImage(systemName: "plus")
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func addAlarm(){
        let addPageVC = AddPageViewController()
        
        self.navigationController?.pushViewController(addPageVC, animated: true)
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

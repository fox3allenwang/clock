//
//  AddPageViewController.swift
//  clockTry
//
//  Created by Hung-Ming Chen on 2022/8/10.
//

import UIKit

class AddPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPageDatePicker.datePickerMode = .time
        addPageDatePicker.preferredDatePickerStyle = .wheels
        registerCell()
        addPageTableView.isScrollEnabled = true
        print("\(addPageTableView.rowHeight)")

    }
    @IBOutlet weak var addPageDatePicker: UIDatePicker!
    @IBOutlet weak var addPageTableView: UITableView!
    @IBOutlet weak var deleteButton: UIButton!
    
    func registerCell(){
        addPageTableView.register(UINib(nibName: "AddPageLabelCell", bundle: nil), forCellReuseIdentifier: "LabelCell")
        addPageTableView.register(UINib(nibName: "AddPageSwitchCell", bundle: nil), forCellReuseIdentifier: "SwitchCell")
        addPageTableView.delegate = self
        addPageTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0,1,2:
            let cell = addPageTableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! AddPageLabelCell
            
            cell.settingLabel.text = "Repeat"
            cell.showLabel.text = "??"
            cell.chevronImageView.image = UIImage(systemName: "chevron.right")
            return cell
        case 3:
            let cell = addPageTableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! AddPageSwitchCell
            return cell
        default:
            return UITableViewCell()
        }
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableViewHeight = addPageTableView.frame.height
        let cellHeight = tableViewHeight / 4
        print("\(cellHeight)")
        return cellHeight
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

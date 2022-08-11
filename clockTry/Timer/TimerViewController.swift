//
//  TimerViewController.swift
//  clockTry
//
//  Created by Hung-Ming Chen on 2022/8/8.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimeLabel.isHidden = true
        TimeLabel.text = "00:00:00"
        TimeLabel.textAlignment = .center
        TimeLabel.font = TimeLabel.font.withSize(50)
        
        StartStopButton.setTitle("Start", for: .normal)
        StartStopButton.setTitleColor(.green, for: .normal)
        
        CancelButton.isEnabled = false
        CancelButton.setTitle("Cancel", for: .normal)
        CancelButton.setTitleColor(.lightGray, for: .normal)

        TimerPickerView.delegate = self
        TimerPickerView.dataSource = self
    }
    
    @IBOutlet weak var TimerPickerView: UIPickerView!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var StartStopButton: UIButton!
    @IBOutlet weak var TimeLabel: UILabel!
    
    var startStauts = true
    var timer = Timer()
    
    @IBAction func StartOrStop(_ sender: Any) {
        if timeInterval == 0{
            timeInterval = (hour * 3600 + minute * 60 + second) * 100
        }
        if startStauts {
            startStauts = false
            
            TimerPickerView.isHidden = true
            
            TimeLabel.isHidden = false
            
            StartStopButton.setTitle("Stop", for: .normal)
            StartStopButton.setTitleColor(.red, for: .normal)
            
            CancelButton.isEnabled = true
            CancelButton.setTitleColor(.black, for: .normal)
            
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(0.01), target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        }else{
            startStauts = true
            
            StartStopButton.setTitle("Start", for: .normal)
            StartStopButton.setTitleColor(.green, for: .normal)
            
            timer.invalidate()
        }
    }
    
    @IBAction func Cancel(_ sender: Any) {
        startStauts = true
        
        StartStopButton.setTitle("Start", for: .normal)
        StartStopButton.setTitleColor(.green, for: .normal)
        
        CancelButton.isEnabled = false
        CancelButton.setTitleColor(.lightGray, for: .normal)
        
        TimerPickerView.isHidden = false
        
        TimeLabel.isHidden = true
        
        timeInterval = 0
        timer.invalidate()
    }
    
    let numbersOf24 = [Int](0...23)
    let numbersOf60 = [Int](0...59)
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return numbersOf24.count
        case 2:
            return numbersOf60.count
        case 4:
            return numbersOf60.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return numbersOf24[row].description
        case 1:
            return "時"
        case 2:
            return numbersOf60[row].description
        case 3:
            return "分"
        case 4:
            return numbersOf60[row].description
        case 5:
            return "秒"
        default:
            return "error"
        }
    }
    
    var hour = 0
    var minute = 0
    var second = 0
    var timeInterval = 0
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = numbersOf24[row]
        case 2:
            minute = numbersOf60[row]
        case 4:
            second = numbersOf60[row]
        default:
            return
        }
    }
    
    var calcuSec = 0
    var calcuMin = 0
    var calcuHor = 0
    
    @objc func countDown(){
        if timeInterval != 0{
            timeInterval -= 1
            
            calcuSec = (timeInterval / 100) % 60
            calcuMin = (timeInterval / 6000) % 60
            calcuHor = (timeInterval / 360000) % 24
            
            TimeLabel.text = String(format: "%02d:%02d:%02d", arguments: [calcuHor, calcuMin, calcuSec])
            
        }else{
            let alertController = UIAlertController(title: nil, message: "Times up", preferredStyle: .alert)
            let reSetTimer = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(reSetTimer)
            present(alertController, animated: true, completion: nil)
            
            startStauts = true
            
            TimerPickerView.isHidden = false
            
            TimeLabel.isHidden = true
            
            StartStopButton.setTitle("Start", for: .normal)
            StartStopButton.setTitleColor(.green, for: .normal)
            
            CancelButton.isEnabled = false
            CancelButton.setTitleColor(.lightGray, for: .normal)
            
            timer.invalidate()
        }
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

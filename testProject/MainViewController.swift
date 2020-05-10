
//  MainViewController.swift
//  testProject
//
//  Created by admin on 2020/05/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    let currentTime:UILabel, selectedTime:UILabel, datePicker:UIDatePicker, formatter = DateFormatter()
    var alarmTime = ""
    
    init(){
        currentTime = UILabel()
        selectedTime = UILabel()
        datePicker = UIDatePicker()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        setView()
        // Do any additional setup after loading the view.
    }
    
    func setView(){
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(self.pickDate(_:)), for: .allEvents)
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.widthAnchor.constraint(equalTo: view.widthAnchor),
            datePicker.heightAnchor.constraint(equalTo: datePicker.heightAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        currentTime.text = "current Time"
        view.addSubview(currentTime)
        currentTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentTime.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            currentTime.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            currentTime.bottomAnchor.constraint(equalTo: datePicker.topAnchor, constant: 10)
        ])
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        
        
        selectedTime.text = "selected Time"
        view.addSubview(selectedTime)
        selectedTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectedTime.leftAnchor.constraint(equalTo: currentTime.leftAnchor),
            selectedTime.rightAnchor.constraint(equalTo: currentTime.rightAnchor),
            selectedTime.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 10)
        ])
        
        
    }
    
    
    @objc func pickDate(_ sender:UIDatePicker){
        alarmTime = formatter.string(from: sender.date)
        selectedTime.text = "selected Time: " + alarmTime
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let current = formatter.string(from: date as Date)
        currentTime.text = "current Time: " + current
        if alarmTime == current {
            view.backgroundColor = .red
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

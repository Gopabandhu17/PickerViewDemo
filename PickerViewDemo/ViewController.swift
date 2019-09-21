//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Gopabandhu on 06/08/19.
//  Copyright © 2019 Gopabandhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var txtSelectDay: UITextField!
    @IBOutlet weak var lblSelectedDay: UILabel!
    
    var arrOfDay = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrOfDay = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thrusday", "Friday", "Saturday"]
        
        self.createDayPicker()
        self.createToolBar()
    }

    
    func createDayPicker(){
        
        let dayPicker = UIPickerView()
        dayPicker.delegate = self
        
        dayPicker.backgroundColor = .black
        
        txtSelectDay.inputView = dayPicker
    }
    

    func createToolBar(){
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissDayPicker))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        txtSelectDay.inputAccessoryView = toolBar
        
    }
    
    
    @objc func dismissDayPicker(){
        
        self.view.endEditing(true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrOfDay.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrOfDay[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedDay = arrOfDay[row]
        self.txtSelectDay.text = selectedDay
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let lbl = UILabel()

        
        lbl.textColor = .green
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Menlo Regular", size: 20.0)

        lbl.text = arrOfDay[row]

        return lbl
    }
    
}


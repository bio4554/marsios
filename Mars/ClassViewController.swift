//
//  ViewController.swift
//  Mars
//
//  Created by Austin Childress on 8/12/16.
//  Copyright © 2016 Mars Dev. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var newNameField: UITextField!
    @IBOutlet weak var newClassField: UITextField!
    @IBOutlet weak var newLevelView: UILabel!
    @IBOutlet weak var newStepper: UIStepper!
    @IBOutlet weak var newDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var newDateLabel: UILabel!
    
    var nclass: Class?
    
    
    
    
    
    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        newDateLabel.text = dateFormatter.string(from: newDatePicker.date)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let nname = newNameField.text ?? ""
            let nclasst = newClassField.text ?? ""
            let nlevel = Int(newLevelView.text!)
            let ndate = newDatePicker.date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let ndatestring = dateFormatter.string(from: ndate)
            nclass = Class(namet: nname, levelt: nlevel!, iclasst: nclasst, datet: ndatestring)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newNameField.delegate = self
        newClassField.delegate = self
        checkValidClassName()
        newStepper.minimumValue = 0
        newStepper.maximumValue = 999
        newStepper.stepValue = 1
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        newDateLabel.text = dateFormatter.string(from: newDatePicker.date)
        
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ClassViewController.dismissKeyboard)))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        newNameField.resignFirstResponder()
        newClassField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidClassName()
    }
    
    func checkValidClassName() {
        let text = newNameField.text ?? ""
        let text2 = newClassField.text ?? ""
        if text.isEmpty || text2.isEmpty {
            saveButton.isEnabled = false
            return
        }
        saveButton.isEnabled = true
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        newLevelView.text = Int(sender.value).description
    }

}


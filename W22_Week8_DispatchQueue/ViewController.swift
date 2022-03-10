//
//  ViewController.swift
//  W22_Week8_DispatchQueue
//
//  Created by Rania Arbash on 2022-03-10.
//

import UIKit

class ViewController: UIViewController,
                        UIPickerViewDelegate,
                      UIPickerViewDataSource {

    @IBOutlet weak var doneLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    @IBAction func startLongTask(_ sender: Any) {
         
        let q = DispatchQueue.init(label: "myQ")
       
        q.async {
            // task that takes time start
            // this should run in background thread not in main thread
            Thread.sleep(forTimeInterval: 20)
            // any task that takes time
            
            DispatchQueue.main.async {
                 // any code to implement in main thread after finish the thread implementation
                self.doneLabel.text = "DONE!!!"// no way to access main thread
                   }
            
           
        }
        
      
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0){
            return "Hello"
        }
        else{
            return "iOS"
        }
    }


}


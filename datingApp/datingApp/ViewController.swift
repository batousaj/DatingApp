//
//  ViewController.swift
//  datingApp
//
//  Created by Vu Thien on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {

    //init constant
    let temp = "This is a sample App"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonMale(_ sender: Any) {
        
    }
    
    @IBAction func buttonFemale(_ sender: Any) {
        
    }
    
    func checkCorrect() -> Int32 {
        var a:Int32?
        
        a = 10;
        
        if a! > 25 {
            print("\(temp)");
        } else {
            print("Not \(temp)");
        }
        return a!;
    }
}


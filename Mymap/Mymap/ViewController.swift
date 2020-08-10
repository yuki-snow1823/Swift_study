//
//  ViewController.swift
//  Mymap
//
//  Created by Horikoshi Yuki on 2020/08/09.
//  Copyright © 2020 優希 堀越. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // デリゲート機能の通知
        inputText.delegate = self
    }


    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var dispMap: MKMapView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        if let searchKey = textField.text {
            
            print(searchKey)
        }
        return true
    }
}


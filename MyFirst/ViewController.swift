//
//  ViewController.swift
//  MyFirst
//
//  Created by Horikoshi Yuki on 2020/07/30.
//  Copyright © 2020 com.gmail.y.horikoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = "Hello Swift!"
    }


    @IBOutlet weak var outputLabel: UILabel!
}


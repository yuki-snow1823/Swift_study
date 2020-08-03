//
//  ViewController.swift
//  Myjanken
//
//  Created by Horikoshi Yuki on 2020/08/01.
//  Copyright © 2020 優希 堀越. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var answeImageView: UIImageView!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var answerNumber = 0
   
    @IBAction func suffleAction(_ sender: Any) {
        var newAnswerNumber = 0
        
        repeat {
            newAnswerNumber = Int.random(in: 0 ..< 3)
        } while answerNumber == newAnswerNumber
        
        answerNumber = newAnswerNumber
        
        if answerNumber == 0 {
            answerLabel.text = "グー"
            answeImageView.image = UIImage(named: "gu")

        }
        else if answerNumber == 1 {
            answerLabel.text = "チョキ"
            answeImageView.image = UIImage(named: "choki")
            
        }
        else if answerNumber == 2 {
            answerLabel.text = "パー"
            answeImageView.image = UIImage(named: "pa")
            
        }
//        answerNumber = answerNumber + 1
//        ランダムが上にあるから削除
    }
    
}


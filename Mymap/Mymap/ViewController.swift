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
            
            let geocoder = CLGeocoder()
            
            geocoder.geocodeAddressString(searchKey , completionHandler: { (placemarks, error) in
                
                // 位置情報が存在する場合は、unwrapPlacemarksに取り出す(7)
                if let unwrapPlacemarks = placemarks {
                    
                    // 1件目の情報を取り出す(8)
                    if let firstPlacemark = unwrapPlacemarks.first {
                        
                        // 位置情報を取り出す(9)
                        if let location = firstPlacemark.location {
                            
                            // 位置情報から緯度経度をtargetCoordinateに取り出す(10)
                            let targetCoordinate = location.coordinate
                            
                            // 緯度経度をデバッグエリアに表示(11)
                            print(targetCoordinate)
                            
                            // MKPointAnnotationインスタンスを取得し、ピンを生成(12)
                            let pin = MKPointAnnotation()
                            
                            // ピンの置く場所に緯度経度を設定(13)
                            pin.coordinate = targetCoordinate
                            
                            // ピンのタイトルを設定(14)
                            pin.title = searchKey
                            
                            // ピンを地図に置く(15)
                            self.dispMap.addAnnotation(pin)
                            
                            // 緯度経度を中心にして半径500mの範囲を表示(16)
                            self.dispMap.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                        }
                    }
                }
            })
        }
        return true
    }
}


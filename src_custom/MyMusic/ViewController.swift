//
//  ViewController.swift
//  MyMusic
//
//  Created by Swift-Beginners on 2019/08/23.
//  Copyright © 2019 Swift-Beginners. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")

    // シンバル用プレイヤーの変数
    var cymbalPlayer: AVAudioPlayer!
 
    @IBAction func cymbal(_ sender: Any) {
        soundPlayer(player: &cymbalPlayer ,path:cymbalPath, count: 0)
    }
    
    // ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")
    
    // ギター用プレイヤーの変数
    var guitarPlayer: AVAudioPlayer!

    // ギターがタップされた時の処理
    @IBAction func guitar(_ sender: Any) {
        soundPlayer(player: &guitarPlayer ,path:guitarPath, count: 0)
    }
    // バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    // バックミュージック用プレイヤーの変数
    var backmusicPlayer: AVAudioPlayer!
    
    // Playボタンがタップされた時の処理
    @IBAction func play(_ sender: Any) {
        soundPlayer(player: &backmusicPlayer ,path:backmusicPath, count: -1)
    }
    
    // Stopボタンがタップされた時の処理
    @IBAction func stop(_ sender: Any) {
        // バックミュージック停止
        backmusicPlayer.stop()
    }
    
    // 共通のプレイヤー再生処理
    fileprivate func soundPlayer(player:inout AVAudioPlayer!, path: URL, count: Int) {
        do {
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        } catch {
            print("エラーが発生しました！")
        }
    }

}


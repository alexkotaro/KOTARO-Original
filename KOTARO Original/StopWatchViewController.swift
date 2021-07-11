//
//  StopWatchViewController.swift
//  KOTARO Original
//
//  Created by Kotaro Matsuda on 2021/05/15.
//

import UIKit

class StopWatchViewController: UIViewController, backgroundTimerDelegate {
        
    
    
    var timerIsBackground: Bool = false
    
    var judge: Bool = false
    @IBOutlet var label: UILabel!
    
    var count: Int = 0
    
    var timer: Timer! = Timer()
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        label.text = saveData.object(forKey: "time") as? String
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    @objc func up() {
        //countを0.01足す
        count = count + 1
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start() {
        
        if !timer.isValid {
            //タイマーが動作してなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
                                         judge = true

        }
    }
    
   
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            judge = false
        }
    }
    
    // ViewController.swift
    @IBAction func nextButtonTouchUp(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "HomeView")

        nextVC?.modalPresentationStyle = .fullScreen // ★この行追加
        self.present(nextVC!, animated: true, completion: nil)
    }
   
    @IBAction func reset() {
        if timer.isValid {
            timer.invalidate()
        }
        count = 0
                    label.text = String(format: "%.2f", count)
    }
    func checkBackground() {
        if judge == true {
            //バックグラウンドへの移行を確認
            if let _ = timer {
                timerIsBackground = true
            }
        }
    }
    
    func setCurrentTimer(_ elapsedTime:Int) {
        if judge == true {
            //残り時間から引数(バックグラウンドでの経過時間)を足す
            count += elapsedTime
            label.text = "\(count)"
            //再びタイマーを起動
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    func deleteTimer() {
        if judge == true {
            //起動中のタイマーを破棄
            if let _ = timer {
                timer.invalidate()
            }
        }
    }
    
    

    

    @IBAction func saveMemo() {
        //UserDefaultsに書き込み
        saveData.set(label.text, forKey: "time")
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






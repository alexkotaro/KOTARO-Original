//
//  TsukaViewController.swift
//  KOTARO Original
//
//  Created by Kotaro Matsuda on 2021/02/19.
//

import UIKit

class TsukaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
  
    
    
    }
    @IBAction func homeButtonTouchUp(_ sender:UIButton){
        let nextVC = storyboard?.instantiateViewController(identifier: "HomeView")
        nextVC?.modalPresentationStyle = .fullScreen
        self.present(nextVC!, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

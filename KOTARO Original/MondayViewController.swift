//
//  MondayViewController.swift
//  KOTARO Original
//
//  Created by Kotaro Matsuda on 2021/02/06.
//

import UIKit

class MondayViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = saveData.object(forKey: "Mondaytitle") as? String
        contentTextView.text = saveData.object(forKey: "Mondaycontent") as? String
     
        // Do any additional setup after loading the view.

    }
    @IBAction func saveMemo(){
    
        
        saveData.set(titleTextField.text, forKey: "Mondaytitle")
        saveData.set(contentTextView.text, forKey: "Mondaycontent")
    }
    // ViewController.swift
    @IBAction func nextButtonTouchUp(_ sender: UIButton) {
        let nextVC = storyboard?.instantiateViewController(identifier: "HomeView")

        nextVC?.modalPresentationStyle = .fullScreen // ★この行追加
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

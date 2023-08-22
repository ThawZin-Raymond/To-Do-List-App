

import Foundation
import UIKit
class SetTimerViewController: UIViewController {


    @IBOutlet weak var timerTaskNamefield: UITextField!
    

    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var timerSetLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    
    @IBOutlet weak var secSlider: UISlider!
    @IBOutlet weak var secSetLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
 

    @IBAction func MinChange(_ sender: Any) {
    
    timerSetLabel.text = String(Int(timerSlider.value))
            timerLabel.text = timerSetLabel.text
    }
    
    

    @IBAction func secChange(_ sender: Any) {
    secSetLabel.text = String(Int(secSlider.value))
                secLabel.text = secSetLabel.text
    }
    
    
    @IBAction func Go(_ sender: Any) {
        
        let min = Int(timerSlider.value)
        let sec = Int(secSlider.value)
        print("min and sec", min, sec)
        let timer = min*60 + sec
        print("timer is",timer)
        let userDefault = UserDefaults.standard
             userDefault.setValue(Int(timer), forKey: "timer")
            if timerTaskNamefield.text!.count > 0{
                performSegue(withIdentifier:"GoSegue", sender:nil)
                let name = String(timerTaskNamefield.text!)
                UserDefaults.standard.set(name, forKey: "name")
            }

    }
    
}

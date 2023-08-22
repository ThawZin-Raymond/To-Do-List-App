import UIKit

class SetStopwatchViewController: UIViewController {
    

    @IBOutlet weak var stopwatchLabel: UILabel!
    
   
    @IBOutlet weak var enterTheTaskNameLabel: UILabel!
    
    
    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    
    @IBAction func Start(_ sender: Any) {
        
        
            if taskNameTextField.text!.count > 0{
                performSegue(withIdentifier:"goStopwatchSegue", sender:nil)
                let name2 = String(taskNameTextField.text!)
                UserDefaults.standard.set(name2, forKey: "name2")
            }

    }



}

import UIKit

class TimerViewController: UIViewController {
    var second = 0
    var name = ""
    var min = 0
    var sec = 0
    

  
    @IBOutlet weak var timerLable: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        second = UserDefaults.standard.value(forKey: "timer") as! Int
        name = UserDefaults.standard.value(forKey: "name") as! String
        
        taskNameLabel.text = name
  
        
        print("org time is", second)
        min = second / 60
        second = second % 60
        
        print("format min", min)
        print("format second", second)
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true){
            [self](timer) in
            if  self.second == 0 && self.min == 0{
                timer.invalidate()
                performSegue(withIdentifier:"goTimerEndSegue", sender:nil)
            }
            
            else if self.second == 0 && self.min > 0{
                self.second = 59
                self.min = self.min - 1
                }
            
            else {
                self.second = self.second - 1

            }
            self.timerLable.text = String(self.min)
            self.secLabel.text = String(self.second)
        }
        
        
                
            }
    
    }


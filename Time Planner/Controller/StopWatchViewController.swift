//
//  StopWatchViewController.swift
//  Time Planner
//
//  Created by Thaw Zin on 19/5/21.
//

import UIKit

class StopwatchViewController: UIViewController {
    

    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var nameOfTheTaskLabel: UILabel!
    @IBOutlet weak var startBreakButton: UIButton!
   
    @IBOutlet weak var finishButton: UIButton!
   
    var timer:Timer = Timer()
    var count:Int = 0
    var timerCounting:Bool = false
    var name2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startBreakButton.setTitleColor(UIColor.green, for: .normal)
        
        name2 = UserDefaults.standard.value(forKey: "name2") as! String
        
        nameOfTheTaskLabel.text = name2
    }
    

    
    
    
    @IBAction func startBreakButton(_ sender: Any) {
        if(timerCounting)
        {
            timerCounting = false
            timer.invalidate()
            startBreakButton.setTitle("START", for: .normal)
            startBreakButton.setTitleColor(UIColor.green, for: .normal)
        }
        else
        {
            timerCounting = true
            timer.invalidate()
            startBreakButton.setTitle("BREAK", for: .normal)
            startBreakButton.setTitleColor(UIColor.red, for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerCounter() -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        TimerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString

    }
    



}

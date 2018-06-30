//
//  SecondViewControllerMath.swift
//  IncubatorGameProject
//
//  Created by Жанибек on 29.06.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class SecondViewControllerMath: UIViewController {
  
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var bottomView: UIView!
  @IBOutlet weak var animationLabel: UILabel! {
    didSet {
      
      animationLabel.center.x = animationLabel.center.x
    }
  }
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var textField: UITextField!
  var superView:ViewController!
  var score = 0
  var record = 20
  var x:Int = 0
  var y:Int = 0
  var counter = 0
  var level:Int = 0
  var timer:Timer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    myTargetFunction(textField: textField)
    newQuestion()
    moveQuestionLabel()
     timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveQuestionLabel), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(recordTime), userInfo: nil, repeats: true)
      textField.addTarget(self, action: #selector(myTargetFunction), for: UIControlEvents.touchDown)
    
 
  }
  
  @objc func myTargetFunction(textField: UITextField) {
    print("myTargetFunction")
  }
  
  @IBAction func sumbitAction(_ sender: Any) {
    if textField.text == String(x*y){
      score = score + 1
      scoreLabel.text = String(score)
      textField.text = ""
    }else{
      score = score - 1
      scoreLabel.text = String(score)
      counter = counter + 1
      textField.text = ""
      if counter == 2{
          let alertController = UIAlertController(title: "Game Over", message: "You score is \(score)", preferredStyle: UIAlertControllerStyle.alert)
          let saveAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let newRecord = firstTextField.text
            self.superView.addHumanNameRecord(newRecod: (newRecord)!, score:self.score)
            
          })
          alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter First Name"
          }
          
          alertController.addAction(saveAction)
          
          self.present(alertController, animated: true, completion: nil)
      timer.invalidate()
      }
      
    }
    
    newQuestion()
  }
  
  func newQuestion() {
    switch level {
    case 1:
      x = Int(arc4random_uniform(9) + 1)
      y = Int(arc4random_uniform(9) + 1)
    case 2:
      x = Int(arc4random_uniform(88) + 10)
      y = Int(arc4random_uniform(88) + 10)
    case 3:
      x = Int(arc4random_uniform(888) + 100)
      y = Int(arc4random_uniform(888) + 100)
    default:
      break
      
    }
    
    animationLabel.text = "\(x) x \(y) ="
    animationLabel.center.y = 20
  }
  
  @objc func moveQuestionLabel() {
    if(animationLabel.center.y >= bottomView.center.y) {
      newQuestion()
    }
    UIView.animate(withDuration: 0.2) {
      self.animationLabel.center.y += CGFloat(5)
    
    }
  }
  @objc func recordTime(){
    if record<20{
      if (record>0){
      record = record - 1
      timeLabel.text = "0:\(record)"
        if record == 0{
        let alertController = UIAlertController(title: "Game Over", message: "You score is \(score)", preferredStyle: UIAlertControllerStyle.alert)
        let saveAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alert -> Void in
          let firstTextField = alertController.textFields![0] as UITextField
          let newRecord = firstTextField.text
          self.superView.addHumanNameRecord(newRecod: (newRecord)!, score:self.score)
          
        })
        alertController.addTextField { (textField : UITextField!) -> Void in
          textField.placeholder = "Enter First Name"
        }
        
        alertController.addAction(saveAction)
        
          self.present(alertController, animated: true, completion: nil)}
      }
    }
    else if(record==20){
      record = record - 1
      timeLabel.text = "0:\(record)"
    }
  }
}

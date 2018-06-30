//
//  ViewController.swift
//  IncubatorGameProject
//
//  Created by Жанибек on 29.06.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var recordLabel: UILabel!
  
  @IBOutlet weak var scoreLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib/Users/zanibek/Desktop/Incubator/IncubatorGameProject/IncubatorGameProject/SecondViewControllerMath.swift.
  }
  var level:Int = 0

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func addHumanNameRecord(newRecod:String,score:Int){
    recordLabel.text = newRecod
    scoreLabel.text = "\(score)"
    
  }

  @IBAction func levelBtn(_ sender: UIButton) {
    switch sender.tag{
    case 0:
      level = 1
    case 1:
      level = 2
      print(level)
    case 2:
      level = 3
    default:
      break
    }
  }
  @IBAction func playAction(_ sender: UIButton) {
  
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "MySegue"{
      var destination = segue.destination as! SecondViewControllerMath
      destination.level = level
      destination.superView = self
    }
  }
  
  
  
}


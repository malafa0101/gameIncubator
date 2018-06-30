//
//  UIColorViewController.swift
//  IncubatorGameProject
//
//  Created by Жанибек on 30.06.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import UIKit

class UIColorViewController: UIViewController {
  @IBOutlet weak var colorViewLabel: UILabel!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var scoreLabel: UILabel!
  
  
  var score:Int = 0
  override func viewDidLoad() {
        super.viewDidLoad()

    chekingColors()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func buttonAction(_ sender: UIButton) {
    switch sender.tag{
    case 0:
      if colorViewLabel.text == Colors.init().colors[colorView.backgroundColor!]{
        score = score + 1
        scoreLabel.text = String(score)
      }else{
        score = score - 1
        scoreLabel.text = String(score)
        
        if score == 0{
          let alertController = UIAlertController(title: "Game Over", message: "You score is \(score)", preferredStyle: UIAlertControllerStyle.alert)
          let saveAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alert -> Void in
          })
         
          
          alertController.addAction(saveAction)
          
          self.present(alertController, animated: true, completion: nil)
        }
      }
    case 1:
      if colorViewLabel.text != Colors.init().colors[colorView.backgroundColor!]{
        score = score + 1
                scoreLabel.text = String(score)
      }
      else {
        score = score - 1
      scoreLabel.text = String(score)
      }
    default:
        break
    }
    chekingColors()
  }
  
  func chekingColors(){
    colorView.backgroundColor = Colors().colorArray?.randomColor()
    colorViewLabel.text = Colors().colorName?.randomColor()
    colorViewLabel.textColor = Colors().getText(color: colorView.backgroundColor!)
  }
  
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

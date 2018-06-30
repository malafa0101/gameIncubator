//
//  Random.swift
//  IncubatorGameProject
//
//  Created by Жанибек on 30.06.18.
//  Copyright © 2018 Жанибек. All rights reserved.
//

import Foundation
extension Array{
  func randomColor() -> Element?{
    if isEmpty {return nil}
    let index = Int(arc4random_uniform(UInt32(self.count)))
    return self[index]
  }
  
}

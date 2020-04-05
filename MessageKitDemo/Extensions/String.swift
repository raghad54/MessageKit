//
//  String.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/16/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//


import Foundation
import UIKit


extension String {
  static var randomName: String {
    let adjectives = ["Raghad", "Raed", "Manal", "Nada", "Yousef"]
    let nouns = ["😆", "🕋", "😇", "😉", "😜"]
    
    return adjectives.randomElement()! + nouns.randomElement()!
  }
}


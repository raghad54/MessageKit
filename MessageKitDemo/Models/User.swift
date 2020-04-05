//
//  User.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/17/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import Foundation
import UIKit

class User {
    @objc var id: String?
    @objc var name: String?
    @objc var email: String?
    
    func initWithDic(dic: [String:AnyObject]) {
        self.name = dic["name"] as? String
        self.email = dic["email"] as? String
    }
}

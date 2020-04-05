//
//  Messages.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/14/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import Foundation
import UIKit
import MessageKit



class MessagesKeys: NSObject {
    @objc var fromId: String?
    @objc var toId: String?
    @objc var text: String?
}

//struct Member {
//  let name: String
//  let color: UIColor
//}
//
//struct Message {
//  let member: Member
//  let text: String
//  let messageId: String
//}

//
//extension Message: MessageType {
//  var sender: Sender {
//    return Sender(id: member.name, displayName: member.name)
//  }
//  
//  var sentDate: Date {
//    return Date()
//  }
//  
//  var kind: MessageKind {
//    return .text(text)
//  }
//}

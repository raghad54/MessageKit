//
//  MessageContent.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/17/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import UIKit
import MessageKit
import FirebaseFirestore

class MessageContent: NSObject {
  @objc var fromId: String!
  @objc var toId: String!
  @objc var text: String!
    var name: Message!
  var color: UIColor!
    

}

struct Member {
  let name: String
  let color: UIColor
}

class Message: NSObject {
    @objc var fromId: String!
     @objc var toId: String!
     @objc var text: String!
     var member: Member
    var messageId: String
    var image: UIImage? = nil
    var downloadURL: URL? = nil
    
     init(member: Member, text: String, messageId: String) {
        self.member = member
        self.text = text
        self.messageId = messageId
    }
    
}

extension Message: MessageType {
   
    
 var sender: Sender {
    return Sender(id: AppSettings.uid , displayName: AppSettings.displayName)
  }
  
  var sentDate: Date {
    return Date()
  }
  
  var kind: MessageKind {
    return .text(text)
  }
    
    
}

 


//
//  ViewController.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/14/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import UIKit
import MessageKit
import Firebase
import FirebaseDatabase

class ChattingViewController: MessagesViewController {

    private var messages : [Message] = []
    var appendMessages  = [String]()
    private var member: Member!
    private var reference: CollectionReference?
    var toId: String!
    var fromId = Auth.auth().currentUser?.uid
    var messagesDictionary = [String: Message]()
    var newMessages = [Message]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        checkIfUserLogged()
        configureMessageCollectionView()
        observeMessages()
    }
    
   
    func configureMessageCollectionView() {
        member = Member(name: AppSettings.displayName, color: .random)
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    
    private func checkIfUserLogged() {
        if Auth.auth().currentUser?.uid == nil {
                   let alert = UIAlertController(title: "Alert", message: "Email or Password incorrect", preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
            handleLogout()
               } else {
                   //Fetch users from db
                   let uid = Auth.auth().currentUser?.uid
                   let ref = Database.database().reference().child("users").child(uid!).observe(.value, with: { (snapshot) in
                       print(snapshot)
                       let user = User()
                       if let dic = snapshot.value as? [String: AnyObject] {
                        let users = dic["name"] as? String
                        user.name = users
                        print(users)
                        self.member = Member(name: users!, color: .random)
                        print(self.member.name)
//                       self.navigationController?.title =
                       }
                   }) { (error) in
                       print("Error")
                   }
                       
               }
    }
    
    
    private func handleLogout() {
           do {
              try Auth.auth().signOut()
            
           } catch let logoutError {
               print("LogoutError")
           }
       }
    
// Fetch messages from firebase
    private func observeMessages() {
        let ref = Database.database().reference().child("Messages")
            ref.observe(.childAdded, with: { (snapshot) in
                print(snapshot)
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    let message = Message(member: self.member.self , text: "", messageId: "")
                    message.setValuesForKeys(dictionary)
                    self.messages.append(message)
                    print(self.messages)
                 //   self.messages.append(contentsOf: messages.text) as? String
//                    if let toId = message.toId{
//                        self.messagesDictionary[toId] = message
//                        self.messages = Array(self.messagesDictionary.values)
//
//                    }
                    DispatchQueue.main.async {
                        self.messagesCollectionView.reloadData()
                        self.messagesCollectionView.scrollToBottom(animated: true)

                    }
                }
        }) { (error) in
            print("error")
        }
    }
    
}

extension ChattingViewController: MessagesDataSource {
    func currentSender() -> Sender {
        return Sender(id: AppSettings.uid, displayName:AppSettings.displayName)
    }
    
  func numberOfSections(
    in messagesCollectionView: MessagesCollectionView) -> Int {
    return messages.count
  }
  
  func messageForItem(
    at indexPath: IndexPath,
    in messagesCollectionView: MessagesCollectionView) -> MessageType {
    return messages[indexPath.section]
  }
  
  func messageTopLabelHeight(
    for message: MessageType,
    at indexPath: IndexPath,
    in messagesCollectionView: MessagesCollectionView) -> CGFloat {
    
    return 10  }

  
    private func messageTopLabelAttributedText(
    for message: Message,
    at indexPath: IndexPath) -> NSAttributedString? {
    
    return NSAttributedString(
        string: message.member.name ,
      attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor(white: 0.3, alpha: 1)])
  }
}


extension ChattingViewController: MessagesLayoutDelegate {
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }

    func footerViewSize(for section: Int, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }
//
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
}

extension ChattingViewController: MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ?  .green : .gray
    }
    
    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
      }

      func messageStyle(for message: MessageType, at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) -> MessageStyle {

        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomLeft : .bottomRight
        return .bubbleTail(corner, .curved)
      }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let message = messages[indexPath.section]
        let color  = message.member.color
        avatarView.backgroundColor = color
    }
}

extension ChattingViewController: MessageInputBarDelegate {
    func messageInputBar(
      _ inputBar: MessageInputBar,      
      didPressSendButtonWith text: String) {
        let ref = Database.database().reference().child("Messages")
        let value = ["text": text, "toId": toId, "fromId" : fromId ]
        let childRef = ref.childByAutoId()
        childRef.updateChildValues(value)
        let newMessage = Message(
            member: member ,
            text: text,
            messageId: fromId!)
            // messages.append(newMessage)
           inputBar.inputTextView.text = ""
        self.messagesCollectionView.scrollToBottom(animated: true)

          // messagesCollectionView.reloadData()
          // messagesCollectionView.scrollToBottom(animated: true)
//        let item = messages.count - 1
//        let inserIndexPath = IndexPath(item: item, section: 1)
//        messagesCollectionView.insertItems(at: [(inserIndexPath)])
//        messagesCollectionView.scrollToItem(at: inserIndexPath, at: .bottom, animated: true)
         

    }
}






/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Firebase
import MessageKit
import FirebaseFirestore

//struct Message: MessageType {
//  var kind: MessageKind
//  var id: String
//  let content: String
//  let sentDate: Date
//  let sender: Sender
//  let color: UIColor
//  let image: UIImage?
//
//
//
//  var data: MessageKind {
//    if content == ""
//     {
//        return .text(content)
//    } else {
//        return .photo(image!)
//    }
//  }
//
//  var messageId: String {
//    return id
//  }
//
//  var downloadURL: URL? = nil
//
//    init(user: String, content: String) {
//    sender = Sender(id: "GvhSLUk2duSyW1gMi2ORiicnuS92", displayName: "AppSettings.displayName")
//    self.kind = MessageKind.text(content)
//    self.content = content
//    sentDate = Date()
//    color = .black
//    image = UIImage(named: "")
//    id = ""
//  }
//
//    init(user: User, image: UIImage) {
//    sender = Sender(id: user.uid, displayName: "")
//    self.image = image
//        self.kind = MessageKind.photo(image)
//    content = ""
//    sentDate = Date()
//    color = .black
//    id = ""
//  }
//}
////init?(document: QueryDocumentSnapshot) {
////    let data = document.data()
////
////    guard let sentDate = data["created"] as? Date else {
////      return nil
////    }
////    guard let senderID = data["senderID"] as? String else {
////      return nil
////    }
////    guard let senderName = data["senderName"] as? String else {
////      return nil
////    }
////
////    id = document.documentID
////
////    self.sentDate = sentDate
////    sender = Sender(id: senderID, displayName: senderName)
////
////    if let content = data["content"] as? String {
////      self.content = content
////      downloadURL = nil
////    } else if let urlString = data["url"] as? String, let url = URL(string: urlString) {
////      downloadURL = url
////      content = ""
////    } else {
////      return nil
////    }
////  }
////
////
////
//extension Message: DatabaseRepresentation {
//
//  var representation: [String : Any] {
//    var rep: [String : Any] = [
//      "created": sentDate,
//      "senderID": sender.id,
//      "senderName": sender.displayName
//    ]
//
//    if let url = downloadURL {
//      rep["url"] = url.absoluteString
//    } else {
//      rep["content"] = content
//    }
//
//    return rep
//  }
//
//}
//
//extension Message: Comparable {
//
//  static func == (lhs: Message, rhs: Message) -> Bool {
//    return lhs.id == rhs.id
//  }
//
//  static func < (lhs: Message, rhs: Message) -> Bool {
//    return lhs.sentDate < rhs.sentDate
//  }
//
//}
//
//extension UIImage: MediaItem {
//  public var url: URL? { return nil }
//  public var image: UIImage? { return self }
//  public var placeholderImage: UIImage { return self }
//  public var size: CGSize { return  CGSize.zero }
//}
//

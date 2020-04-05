//
//  NewMessageTableViewController.swift
//  MessageKitDemo
//
//  Created by Raghad'Mac on 11/17/19.
//  Copyright © 2019 Raghad'Mac. All rights reserved.
//

import UIKit
import Firebase


class NewMessageTableViewController: UITableViewController {

     var users = [User]()
     let cellId = "cellId"
     var userId: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(NewMessageTableViewCell.self, forCellReuseIdentifier: cellId)
         fetchUsers()
       // self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

    }

    private func setupTableViewStyle() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].email
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ChattingViewController") as! ChattingViewController
                       self.navigationController?.pushViewController(controller, animated: true)
        
        controller.toId = userId
        
    }

    private func fetchUsers() {
        //Fetch users from db
       //let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").observe(.value, with: { (snapshot) in
            print(snapshot)
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                print(child.key)
                let user = User()
                user.id = child.key 
                self.userId = user.id
                 print( self.userId)
                let value = child.value as? NSDictionary
                user.initWithDic(dic: value as! [String : AnyObject])
                self.users.append(user)
                print(user.name)
            }
                        
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
       }) { (error) in
           print("Error")
       }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

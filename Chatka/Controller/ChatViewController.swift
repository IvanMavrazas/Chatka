//
//  ChatViewController.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/20/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    var messages: [Message] = [Message]()
    
    
    @IBOutlet weak var messageTextView: UITextField!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    @IBOutlet weak var messageTableView: UITableView!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTextView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        messageTableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        retrieveMessages()
    }
    

    func textFieldDidBeginEditing(_ textField: UITextField) {

        UIView.animate(withDuration: 0.5) {
            
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func tableViewTapped() {
        messageTextView.endEditing(true )
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        cell.messageBody.text = messages[indexPath.row].messageText
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextView.endEditing(true)
        messageTextView.isEnabled = false
        sendMessageButton.isEnabled = false
        
        let messagesDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody": messageTextView.text!]
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error,reference) in
            
            if error != nil {
                print(error!)
            } else {
                print("Message saved successfully!")
            }
            
            self.messageTextView.isEnabled = true
            self.sendMessageButton.isEnabled = true
            self.messageTextView.text = nil
        }
    }
    
    func retrieveMessages() {
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            let message = Message()
            message.messageText = text
            message.sender = sender
            
            self.messages.append(message)
            
            self.messageTableView.reloadData()
        }
    }
}

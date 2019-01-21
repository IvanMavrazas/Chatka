//
//  ChatViewController.swift
//  Chatka
//
//  Created by Ivan Mavrazas on 1/20/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let messages: [String] = ["firstmessage", "Secondmessage"]

    @IBOutlet weak var messageTextView: UITextField!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        messageTableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        cell.messageBody.text = messages[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
}

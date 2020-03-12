//
//  ViewController.swift
//  SwiftChat
//
//  Created by anita on 2020-02-28.
//  Copyright © 2020 anita. All rights reserved.
//
//  Group Members
//  -------------
//  ANITA RUSSO         (101073718)
//  CHRISTOPHER HUGHES  (100443694)
//  SAAD KHAN           (101157307)

import UIKit

// view controller for connection page
// TODO
// 1- implement backend logic for login
// 2- make sure username & password match and user can enter specified group


class ConnectVC: UIViewController {
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var channelTxt: UITextField!
    @IBAction func connect(_ sender: Any) {
        self.performSegue(withIdentifier: "connectSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // accessing Nav Controller and ChannelVC view
        if let navigationController = segue.destination as? UINavigationController,
            let channelVC = navigationController.viewControllers.first as? ChannelVC{
            var username = ""
            var channel = ""
            // replacing empty values with default ones
            if(usernameTxt.text == ""){
                username = "Anonymous"
            }
            else{
                username = usernameTxt.text ?? "Anonymous"
            }
            if(channelTxt.text == "" ){
                channel = "General"
            }
            else{
                channel = channelTxt.text ?? "General"
            }
            // setting values in ChannelVC
            channelVC.username = username
            channelVC.channelName = channel
        }
    }



}


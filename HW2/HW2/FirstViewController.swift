//
//  ViewController.swift
//  HW2
//
//  Created by Елизавета Новожилова on 01.07.2024.
//

import UIKit

var users = [(username: "liza", password: "n"), (username: "minion", password: "bebra")]

class FirstViewController: UIViewController {
    let usernames: String = "liza"
    let passwords: String = "n"

    @IBOutlet weak var instruction: UILabel!
    @IBOutlet weak var auth: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.backgroundColor = .darkGray
    }
    
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning()
    }
    
    @IBAction func button(_ sender: Any) {
        for i in 0..<users.count {
            if username.text == users[i].username && password.text == users[i].password {
                auth.text = "loading"
            } else {
                auth.text = "Wrong username or password"
                auth.textColor = .red
                
        
            }
        }
    }
    
    



}

